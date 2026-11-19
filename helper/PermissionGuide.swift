// PermissionGuide: a floating window beside System Settings while someone
// turns on a privacy permission.
//
// Source: arfct/ops, plugins/artifact/skills/setup-guide. Copy this file into
// the app unchanged and change it there only for app-specific needs; fixes go
// back to ops so every app gets them. Builds for macOS 13 and later, in Swift
// 5 and Swift 6 language modes.
//
// `PermissionGuide.show(_:)` opens System Settings at the permission's list
// and puts a small window next to the Settings window. The window shows the
// app's icon, which can be dragged onto the list when the app isn't in it,
// and the steps. It checks the permission once a second and closes itself
// when the permission is on.
//
// The window is a standard titled window at the floating level, not a
// non-activating panel: a drag can begin only from a key window of the
// active app, so a panel that never becomes key can't start one.

import AppKit
import SwiftUI

/// One permission the guide can walk through.
struct PermissionGuideItem {
    /// The window's title and the permission's name in Settings ("Accessibility").
    var name: String
    /// The anchor in Privacy & Security, such as `Privacy_Accessibility`.
    var anchor: String
    /// The steps, in order, as Settings names things.
    var steps: [String]
    /// Whether the permission is on. Checked once a second.
    var isGranted: () -> Bool
    /// Called before the guide opens Settings: the place to call the
    /// prompting check (`AXIsProcessTrustedWithOptions`), which is what puts
    /// the app in the list.
    var register: (() -> Void)? = nil

    /// Accessibility, with the prompting check that adds the app to the list.
    static func accessibility(app: String = PermissionGuide.appName) -> PermissionGuideItem {
        PermissionGuideItem(
            name: "Accessibility",
            anchor: "Privacy_Accessibility",
            steps: [
                "Find \(app) in the list and turn it on.",
                "Not in the list? Drag the icon onto the list, then turn it on.",
            ],
            isGranted: { AXIsProcessTrusted() },
            register: {
                _ = AXIsProcessTrustedWithOptions(["AXTrustedCheckOptionPrompt": true] as CFDictionary)
            })
    }

    /// Full Disk Access. macOS has no check for it; `isGranted` is the app's
    /// own test, such as reading a file only Full Disk Access can open.
    static func fullDiskAccess(app: String = PermissionGuide.appName, isGranted: @escaping () -> Bool) -> PermissionGuideItem {
        PermissionGuideItem(
            name: "Full Disk Access",
            anchor: "Privacy_AllFiles",
            steps: [
                "Drag the icon onto the list.",
                "Turn on \(app).",
                "If macOS asks, choose Quit & Reopen.",
            ],
            isGranted: isGranted)
    }
}

@MainActor
final class PermissionGuide: NSObject, NSWindowDelegate {
    static let shared = PermissionGuide()

    nonisolated static var appName: String {
        Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
            ?? Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String
            ?? ProcessInfo.processInfo.processName
    }

    /// Privacy & Security, as Settings names its extension. macOS 13 renamed
    /// it from `com.apple.preference.security`, which macOS 27.2 still accepts.
    static let privacyPane = "com.apple.settings.PrivacySecurity.extension"

    /// Called when a drag of the icon starts (`true`) and ends (`false`).
    /// An app with an active event tap turns the tap off for the drag: a tap
    /// that holds mouse events keeps the drop from landing.
    var onDrag: ((Bool) -> Void)?
    /// Called when the guide closes, with whether the permission was granted.
    var onClose: ((Bool) -> Void)?

    private var window: NSWindow?
    private var item: PermissionGuideItem?
    private var poll: Timer?
    private var placed = false

    /// Opens Settings at `item`'s list and shows the guide beside it.
    func show(_ item: PermissionGuideItem) {
        close(granted: false, notify: false)
        self.item = item
        if item.isGranted() {
            onClose?(true)
            return
        }
        item.register?()
        Self.openSettings(item.anchor)

        let window = makeWindow(for: item)
        self.window = window
        placed = false
        place(window)
        window.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)

        poll = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            Task { @MainActor in self?.tick() }
        }
    }

    /// Opens Privacy & Security at `anchor` without the guide.
    static func openSettings(_ anchor: String) {
        if let url = URL(string: "x-apple.systempreferences:\(privacyPane)?\(anchor)") {
            NSWorkspace.shared.open(url)
        }
    }

    func close() { close(granted: false, notify: true) }

    private func tick() {
        guard let item, let window else { return }
        if item.isGranted() {
            close(granted: true, notify: true)
            return
        }
        // Settings can take a few seconds to open its window; until the guide
        // has found it, it keeps looking.
        if !placed { place(window) }
    }

    private func close(granted: Bool, notify: Bool) {
        poll?.invalidate()
        poll = nil
        let wasOpen = window != nil
        window?.delegate = nil
        window?.close()
        window = nil
        if notify, wasOpen { onClose?(granted) }
    }

    func windowWillClose(_ notification: Notification) {
        poll?.invalidate()
        poll = nil
        window = nil
        onClose?(false)
    }

    private func makeWindow(for item: PermissionGuideItem) -> NSWindow {
        let view = PermissionGuideView(
            item: item,
            appName: Self.appName,
            onDrag: { [weak self] dragging in self?.onDrag?(dragging) },
            reopen: { Self.openSettings(item.anchor) })
        let hosting = NSHostingView(rootView: view)
        hosting.frame.size = hosting.fittingSize
        let window = NSWindow(contentRect: NSRect(origin: .zero, size: hosting.fittingSize),
                              styleMask: [.titled, .closable], backing: .buffered, defer: false)
        window.title = "Allow \(item.name)"
        window.contentView = hosting
        window.level = .floating
        window.isReleasedWhenClosed = false
        window.collectionBehavior = [.moveToActiveSpace, .fullScreenAuxiliary]
        window.delegate = self
        return window
    }

    /// Beside the Settings window, on whichever side has room; the top right
    /// of the screen until Settings has a window.
    private func place(_ window: NSWindow) {
        let size = window.frame.size
        let gap: CGFloat = 12
        if let settings = Self.settingsWindowFrame(),
           let screen = NSScreen.screens.first(where: { $0.frame.intersects(settings) }) ?? NSScreen.main {
            let visible = screen.visibleFrame
            var x = settings.maxX + gap
            if x + size.width > visible.maxX { x = settings.minX - gap - size.width }
            x = min(max(x, visible.minX), visible.maxX - size.width)
            let y = min(max(settings.maxY - size.height, visible.minY), visible.maxY - size.height)
            window.setFrameOrigin(NSPoint(x: x, y: y))
            placed = true
        } else if let visible = NSScreen.main?.visibleFrame {
            window.setFrameOrigin(NSPoint(x: visible.maxX - size.width - 24, y: visible.maxY - size.height - 24))
        }
    }

    /// The System Settings window's frame in AppKit's coordinates. Window
    /// bounds and owners need no permission; window titles would.
    private static func settingsWindowFrame() -> NSRect? {
        guard let list = CGWindowListCopyWindowInfo([.optionOnScreenOnly, .excludeDesktopElements], kCGNullWindowID)
                as? [[String: Any]],
              let primary = NSScreen.screens.first else { return nil }
        let settingsApp = NSRunningApplication.runningApplications(withBundleIdentifier: "com.apple.systempreferences").first
        for info in list {
            guard (info[kCGWindowLayer as String] as? Int) == 0,
                  let pid = info[kCGWindowOwnerPID as String] as? pid_t, pid == settingsApp?.processIdentifier,
                  let bounds = info[kCGWindowBounds as String] as? [String: CGFloat],
                  let x = bounds["X"], let y = bounds["Y"], let w = bounds["Width"], let h = bounds["Height"],
                  w > 200, h > 200 else { continue }
            // Quartz measures from the top of the primary screen; AppKit from its bottom.
            return NSRect(x: x, y: primary.frame.maxY - y - h, width: w, height: h)
        }
        return nil
    }
}

/// The guide's content: the icon to drag, the steps, and a way back to the list.
struct PermissionGuideView: View {
    let item: PermissionGuideItem
    let appName: String
    let onDrag: (Bool) -> Void
    let reopen: () -> Void

    var body: some View {
        HStack(alignment: .top, spacing: 18) {
            VStack(spacing: 6) {
                AppIconDragSource(onDrag: onDrag)
                    .frame(width: 64, height: 64)
                    .padding(8)
                    .background(
                        RoundedRectangle(cornerRadius: 18, style: .continuous)
                            .strokeBorder(style: StrokeStyle(lineWidth: 1.5, dash: [5, 4]))
                            .foregroundColor(.secondary.opacity(0.6)))
                    .help("Drag onto the \(item.name) list in System Settings")
                Text("Drag me").font(.caption.weight(.medium)).foregroundColor(.secondary)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("In System Settings › \(item.name):").font(.headline)
                ForEach(Array(item.steps.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .firstTextBaseline, spacing: 8) {
                        Text("\(index + 1)")
                            .font(.caption.weight(.semibold).monospacedDigit())
                            .frame(width: 18, height: 18)
                            .background(Circle().fill(Color.secondary.opacity(0.2)))
                        Text(step).fixedSize(horizontal: false, vertical: true)
                    }
                }
                Text("This closes when \(appName) is allowed.")
                    .font(.callout).foregroundColor(.secondary)
                Button("Open \(item.name) Settings Again", action: reopen)
                    .buttonStyle(.link)
            }
            .frame(width: 260, alignment: .leading)
        }
        .padding(20)
    }
}

/// The app's icon as an AppKit drag source. The drag carries the app
/// bundle's file URL, the same pasteboard a drag from Finder carries, which
/// the privacy lists accept.
struct AppIconDragSource: NSViewRepresentable {
    let onDrag: (Bool) -> Void

    func makeNSView(context: Context) -> DragView {
        let view = DragView()
        view.onDrag = onDrag
        return view
    }

    func updateNSView(_ view: DragView, context: Context) { view.onDrag = onDrag }

    final class DragView: NSView, NSDraggingSource {
        var onDrag: ((Bool) -> Void)?
        private let url = Bundle.main.bundleURL

        override func draw(_ dirtyRect: NSRect) {
            NSApp.applicationIconImage.draw(in: bounds)
        }

        override func resetCursorRects() { addCursorRect(bounds, cursor: .openHand) }

        override func mouseDown(with event: NSEvent) {
            onDrag?(true)
            let item = NSDraggingItem(pasteboardWriter: url as NSURL)
            item.setDraggingFrame(bounds, contents: NSApp.applicationIconImage)
            beginDraggingSession(with: [item], event: event, source: self)
        }

        func draggingSession(_ session: NSDraggingSession, sourceOperationMaskFor context: NSDraggingContext) -> NSDragOperation {
            .copy
        }

        func draggingSession(_ session: NSDraggingSession, endedAt screenPoint: NSPoint, operation: NSDragOperation) {
            onDrag?(false)
        }
    }
}
