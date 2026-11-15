// Monochrome.app: one binary, picked by argument.
//   (none)          the app: login item, Dock stand-in for Chrome, default browser, ⌃Tab tap, panels;
//                   installs itself at launch (Install.swift)
//   --portable      the app without the login item, Dock tile, default browser or App Shortcuts: only the
//                   native messaging host is registered, for a test run from the build folder
//   --host          native messaging host, spawned by Chrome for the extension (Host.swift)
//   --make-default  ask macOS to make this the default browser (a system dialog), then quit
//   --unregister    remove the login item, then quit
//   --register-host write the native messaging host manifests for this copy of the app, then quit
//   --demo          show the ⌃Tab switcher with sample tabs, to look at it (nothing else runs); prints
//                   the panel's rectangle on stderr for screencapture -R. --thumbs=<dir>: the tabs from
//                   <dir>/tabs.json ([{"title", "favicon"}], favicon a file in <dir>, optional) with <n>.png as
//                   tab n's thumbnail, the walk stopped on the second, as one ⌃Tab leaves it
//   --backdrop      (with --demo, --demo-profiles, --demo-settings) a plain window behind the panel; --backdrop=<image>
//                   draws that image instead, the window at its size in points; --capture=<out.png> then writes
//                   the backdrop's rectangle with the panel over it into a PNG from inside the app (its own
//                   windows need no screen recording permission) and quits
//   --demo-shade    the peek browser shade over Chrome's second window, ordered below its first; prints its rectangle
//   --demo-profiles the profile HUD on Chrome's real Profiles menu, nothing pressed; prints its rectangle
//   --status        the keycodes the current layout gives the shortcut keys, whether the app half is up and
//                   the extension's host is connected
//   --routes [url [sender]]  the link rules (Routes.swift) and, for a URL, the rule it would take
//   --settings      open the settings window of the running app (started if it is not)
//   --demo-omnibox <out.png> [dark]  the ⌘L/⌘T box on sample history, drawn into a PNG
//   --omnibox-snapshot <out.png>  the open ⌘L/⌘T box as on screen, into a PNG
//   --omnibox chrome|safari [query] [--show] [--current] [--commit] [--profile=<name, Safari id prefix, @last, or @all to ask each connection for data>]  the
//                   ⌘L/⌘T box's model for that browser's profile, typed into without showing it (--show: the panel shown, typed into through
//                   its field; it takes the keyboard); the running app logs the rows (Omnibox.swift)
//   --check-safari <json>  the Safari readers' pure parts on given input, for the tests (Safari.swift)
//   --prefs [--defaults]  the `prefs` message the app sends the extension, as JSON: the current values, or
//                   the defaults (Prefs.swift), which the tests compare with the extension's PREF_DEFAULTS
//   --demo-settings [tab] [out.png] [dark]  the settings window on a tab (general, browser, tabs, mini,
//                   command, player, router, or 0 to 6; Router when none) over a scratch defaults suite,
//                   with sample rules and profiles; with out.png, drawn into that file from the view and quit
//   --check-tldr    a reader summarize request on stdin; the model's pieces on stdout, one JSON object per line (Reader.swift)
// Log: log stream --info --predicate 'subsystem == "com.artifact.monochrome"' (Accessibility shows there; asking
// from a shell would report the terminal's grant, not the app's)
import AppKit
import ServiceManagement

switch CommandLine.arguments.dropFirst().first {
case "--host":
  Host.run()
case "--demo":
  let app = NSApplication.shared
  app.setActivationPolicy(.accessory)
  showBackdropIfAsked()
  let switcher = Switcher()
  switcher.demo()
  app.run()
case "--demo-profiles":
  let app = NSApplication.shared
  app.setActivationPolicy(.accessory)
  let backdrop = showBackdropIfAsked()
  let profiles = Profiles()
  profiles.demo(sample: backdrop != nil)
  app.run()
case "--demo-settings":
  // The settings window on a tab with sample rules and profiles, on scratch defaults; active over the
  // backdrop, or drawn into a PNG.
  let app = NSApplication.shared
  Prefs.useDemoStore()
  let rest = CommandLine.arguments.dropFirst(2).filter { !$0.hasPrefix("--") }
  let tab = rest.first { !$0.hasSuffix(".png") && $0 != "dark" }.flatMap(SettingsWindow.tabIndex) ?? SettingsWindow.tabIndex("router")!
  let out = rest.first { $0.hasSuffix(".png") }
  if out != nil { app.setActivationPolicy(.accessory) }
  let backdrop = out == nil ? showBackdropIfAsked() : nil
  backdrop?.level = .normal
  DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
    SettingsWindow.shared.demo(tab: tab, out: out, dark: rest.contains("dark"))
    if CommandLine.arguments.contains("--extension") { InstallExtensionPanel.shared.show() }
  }
  app.run()
case "--demo-shade":
  let app = NSApplication.shared
  app.setActivationPolicy(.accessory)
  let overlays = MiniBrowsers()
  overlays.demoShade()
  app.run()
case "--status":
  print("layout: n=\(Keyboard.code(for: "n", qwerty: 45)) o=\(Keyboard.code(for: "o", qwerty: 31)) l=\(Keyboard.code(for: "l", qwerty: 37)) .=\(Keyboard.code(for: ".", qwerty: 47)) ,=\(Keyboard.code(for: ",", qwerty: 43)) (keycodes under the current keyboard layout)")
  print("browser:", Browser.current.name)
  print("app:", NSRunningApplication.runningApplications(withBundleIdentifier: App.bundleId).isEmpty ? "not running" : "running")
  print("host:", Socket.connect(Socket.path).map { close($0); return "socket up" } ?? "socket down")
  exit(0)
case "--prefs":
  Prefs.printPayload(defaults: CommandLine.arguments.contains("--defaults"))
  exit(0)
case "--check-safari":
  exit(SafariCheck.run(CommandLine.arguments.dropFirst(2).first))
case "--check-tldr":
  Task.detached { exit(await ReaderCheck.run()) }
  dispatchMain()
case "--routes":
  let rest = CommandLine.arguments.dropFirst(2)
  Routes.print(url: rest.first, from: rest.dropFirst().first)
  exit(0)
case "--settings":
  func ask(_ tries: Int) {
    if let fd = Socket.connect(Socket.path) {
      let line = Data("{\"settings\":true}\n".utf8)
      _ = line.withUnsafeBytes { write(fd, $0.baseAddress, $0.count) }
      close(fd)
      exit(0)
    }
    guard tries > 0 else { FileHandle.standardError.write(Data("Monochrome is not running\n".utf8)); exit(1) }
    if tries == 12 {
      let open = Process()
      open.executableURL = URL(fileURLWithPath: "/usr/bin/open")
      open.arguments = ["-g", "-b", App.bundleId]
      try? open.run()
    }
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { ask(tries - 1) }
  }
  ask(12)
  RunLoop.main.run()
case "--demo-omnibox":
  let app = NSApplication.shared
  app.setActivationPolicy(.accessory)
  let omnibox = OmniboxController()
  omnibox.demo(out: CommandLine.arguments.dropFirst(2).first ?? "omnibox.png", dark: CommandLine.arguments.contains("dark"))
  app.run()
case "--omnibox", "--omnibox-snapshot":
  let rest = Array(CommandLine.arguments.dropFirst(2))
  let message: [String: Any] = CommandLine.arguments[1] == "--omnibox-snapshot"
    ? ["omniboxSnapshot": rest.first ?? "omnibox.png"]
    : ["omniboxTest": ["browser": rest.first ?? "chrome", "show": rest.contains("--show"), "newTab": !rest.contains("--current"), "commit": rest.contains("--commit"),
                       "profile": rest.first { $0.hasPrefix("--profile=") }.map { String($0.dropFirst(10)) } ?? "",
                       "query": rest.dropFirst().filter { !$0.hasPrefix("--") }.joined(separator: " ")]]
  guard let fd = Socket.connect(Socket.path), var line = try? JSONSerialization.data(withJSONObject: message) else {
    FileHandle.standardError.write(Data("Monochrome is not running\n".utf8))
    exit(1)
  }
  line.append(10)
  _ = line.withUnsafeBytes { write(fd, $0.baseAddress, $0.count) }
  sleep(4) // the app answers to this connection's lifetime; the rows go to the log
  close(fd)
  exit(0)
case "--unregister":
  try? SMAppService.mainApp.unregister()
  exit(0)
case "--make-default":
  Install.makeDefaultBrowser { exit(0) }
  RunLoop.main.run()
case "--register-host":
  // The host manifests alone, for the tests and for a build that is not opened.
  Install.registerHosts()
  exit(0)
default:
  let app = NSApplication.shared
  let delegate = App()
  app.delegate = delegate
  app.run()
}

// --backdrop: a plain 1280 by 800 window behind the panel, for a screenshot that shows nothing else;
// its screen rectangle goes to stderr for screencapture -R. --backdrop=<image> draws that image instead,
// the window at the image's size in points; --capture=<out.png> writes the rectangle into a PNG and quits.
@discardableResult
func showBackdropIfAsked() -> NSWindow? {
  let arg = CommandLine.arguments.first { $0 == "--backdrop" || $0.hasPrefix("--backdrop=") }
  guard let arg else { return nil }
  let image = arg.hasPrefix("--backdrop=") ? NSImage(contentsOfFile: String(arg.dropFirst(11))) : nil
  if arg.hasPrefix("--backdrop=") && image == nil { FileHandle.standardError.write(Data("no image at \(arg.dropFirst(11))\n".utf8)); exit(1) }
  let size = image.map { image in
    let rep = image.representations.first, scale = NSScreen.main?.backingScaleFactor ?? 1
    return rep.map { NSSize(width: CGFloat($0.pixelsWide) / scale, height: CGFloat($0.pixelsHigh) / scale) } ?? image.size
  } ?? NSSize(width: 1280, height: 800)
  let backdrop = NSWindow(contentRect: NSRect(origin: .zero, size: size), styleMask: [.borderless], backing: .buffered, defer: false)
  backdrop.level = .floating
  if let image {
    let view = NSImageView(image: image)
    view.imageScaling = .scaleAxesIndependently
    backdrop.contentView = view
  } else {
    backdrop.contentView = GradientView()
  }
  backdrop.center()
  backdrop.orderFrontRegardless()
  Chrome.demoAnchor = backdrop.frame
  let f = backdrop.frame, top = (NSScreen.screens.first?.frame.height ?? 0) - f.maxY
  FileHandle.standardError.write(Data("backdrop \(Int(f.minX)),\(Int(top)),\(Int(f.width)),\(Int(f.height))\n".utf8))
  if let out = CommandLine.arguments.first(where: { $0.hasPrefix("--capture=") })?.dropFirst(10) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { exit(captureAbove(backdrop, to: String(out)) ? 0 : 1) }
  }
  return backdrop
}

// The window and this app's windows over it, at the display's resolution. CGWindowListCreateImage is
// marked unavailable in the SDK, so it is looked up at run time; an app may image its own windows
// without the screen recording permission screencapture needs.
func captureAbove(_ window: NSWindow, to out: String) -> Bool {
  typealias Capture = @convention(c) (CGRect, UInt32, UInt32, UInt32) -> Unmanaged<CGImage>?
  guard let lib = dlopen("/System/Library/Frameworks/CoreGraphics.framework/CoreGraphics", RTLD_NOW),
        let sym = dlsym(lib, "CGWindowListCreateImage") else { return false }
  let f = window.frame, top = (NSScreen.screens.first?.frame.height ?? 0) - f.maxY
  // kCGWindowListOptionOnScreenAboveWindow | IncludingWindow; kCGWindowImageBoundsIgnoreFraming | BestResolution
  guard let image = unsafeBitCast(sym, to: Capture.self)(CGRect(x: f.minX, y: top, width: f.width, height: f.height), 2 | 8,
                                                          UInt32(truncatingIfNeeded: window.windowNumber), 1 | 8)?.takeRetainedValue(),
        let png = NSBitmapImageRep(cgImage: image).representation(using: .png, properties: [:]) else { return false }
  guard (try? png.write(to: URL(fileURLWithPath: out))) != nil else { return false }
  print(out)
  return true
}

final class GradientView: NSView {
  override func draw(_ dirtyRect: NSRect) {
    NSGradient(colors: [NSColor(red: 0.85, green: 0.89, blue: 0.93, alpha: 1), NSColor(red: 0.95, green: 0.93, blue: 0.89, alpha: 1),
                        NSColor(red: 0.90, green: 0.87, blue: 0.84, alpha: 1)])!.draw(in: bounds, angle: -35)
  }
}
