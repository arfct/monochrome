# What Arc for desktop does that Chrome does not

Research for Monochrome, dated 2026-11-26.

This document lists the features of The Browser Company's Arc browser for macOS and Windows that go beyond Google Chrome, by category. Each row says what the feature does, what Chrome ships in its place as of November 2026, whether Monochrome's `README.md` says Monochrome reproduces it, and where the claim comes from. Arc is being shut down: its Help Center says "Arc is being sunset on December 22, 2026. On that date, Arc for macOS and Windows will stop working, you'll no longer be able to sign in to your Arc account, and we'll turn off all Arc services" ([Arc Sunset][sunset]). The details are under [Arc's status](#arcs-status-on-2026-11-26).

## Summary

- Arc stops working on December 22, 2026. Its makers name Dia as the replacement and say Spaces, folders, pinned tabs and the Tab Switcher carry over to it ([Arc Sunset][sunset]).
- Chrome closed part of the gap in 2026: vertical tabs (rolling out from April 7, 2026), split view of two tabs (Chrome 145, February 2026), a reading mode announced with vertical tabs, and Gemini in Chrome with a side panel and auto browse.
- The Arc behavior Chrome still lacks is mostly in the tab model: pinned tabs that keep a home URL, Favorites shared across Spaces, Spaces themselves, auto-archive of idle tabs, Peek, Little Arc, link routing, a ⌃Tab switcher by recent use, and the sidebar audio player.
- Monochrome's README claims these: locked tabs, new tabs at the top, ⌃Tab by recent use with a switcher, mini browsers, peek browsers, link routing rules, profile hotkeys, the sidebar mini player, a command bar, and a one-time import of Arc's history and autofill. It also claims a reader with a summary, which has no counterpart in Arc's current feature list.
- The README says nothing about Spaces, Favorites, folders, auto-archive of tabs, Split View, Boosts, Easels, Library, Arc Max, themes, sharing or Arc Sync. Those are marked "Not in README: unknown".

## How to read the tables

- **What Arc does** is taken from Arc's Help Center and release notes. Most feature articles were removed from the live Help Center, which carried 22 articles when read on 2026-11-26. Removed articles are cited from Wayback Machine captures dated 2024 to 2026; the Sources section gives each capture's address.
- **Chrome, November 2026** is taken from Google's Chrome Help, the Chrome blog and Chrome for Developers. "None found" means I found no such feature in the Chrome pages listed under Sources. It is not a statement from Google that the feature does not exist. Claims marked "unverified" have no source that I read.
- **Monochrome (README)** is taken only from `README.md` in this repository at the time of writing. "Not in README: unknown" means the README does not mention it.
- Platform notes (macOS only, Windows) repeat what each Help Center article states about itself. Where an article is older than a release note, the release note is cited as well.
- This document does not cover Arc Search for iOS and Android, and it does not rank the features or recommend which to build.

## Arc's status on 2026-11-26

- **Sunset.** Arc for macOS and Windows stops working on December 22, 2026. Accounts are deactivated that day and personal data is deleted within 30 days. The sunset was announced on October 22, 2026, and no new Arc accounts can be created since then. December 15, 2026 is the last day to request a copy or deletion of account data ([Arc Sunset][sunset], [Manage Your Arc Account][account]).
- **Stated reason.** "Keeping a browser safe and secure has become harder and harder in the age of AI, and we can no longer keep Arc as safe and secure as it needs to be. Our security team is focusing on Dia" ([Arc Sunset][sunset]).
- **Updates until then.** "Arc for macOS and Windows will keep getting its usual basic updates and fixes until December 22, 2026. We're no longer adding new features to Arc." The release notes for 2026 are Chromium upgrades and security fixes; the latest entries are dated November 19, 2026 ([Arc Sunset][sunset], [macOS 2024 to 2026 notes][mac2024], [Windows notes][win]).
- **Shift to Dia.** The Browser Company's "Letter to Arc members 2025", published May 26, 2025, says "we stopped actively building new features" and "we are not actively developing the core product experience like we used to", while continuing Chromium upgrades and security fixes ([Letter to Arc members][letter]).
- **Atlassian.** Atlassian announced an agreement to acquire The Browser Company of New York on September 4, 2025, and announced the acquisition complete on October 21, 2025 ([Atlassian blog][atl-blog], [Business Wire][atl-done]). TechCrunch reports the price as $610 million in cash ([TechCrunch][tc]). I could not open Atlassian's own press release on sec.gov, so the price rests on press reports.
- **Where the features go.** The sunset page names Spaces (as Profiles you can swipe between), folders, pinned tabs and the Tab Switcher as carried into Dia. Dia imports Spaces, Favorites, pinned tabs, folders, bookmarks, history, passwords and extensions from Arc ([Arc Sunset][sunset], [Move from Arc to Dia][todia]).
- **Removed before the sunset.** Arc Notes (April 2024), iCloud sync (June 2024), the Recent Tab indicator (February 2024) and Ask on Page (August 28, 2025) were removed earlier. They are listed below and marked as removed.

## Sidebar and tab model

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Sidebar as the tab list | Tabs are a vertical list in a sidebar with three areas: Favorites at the top, Pinned Tabs above a horizontal line, unpinned tabs below it. | Optional vertical tabs: right-click a window, "Show Tabs Vertically". Rolling out from April 7, 2026. No Favorites or pinned-above-the-line areas. | Uses Chrome's vertical tab bar as the sidebar and adds nothing to the window. | [Pinned Tabs][pinned], [Chrome vertical tabs][c-vertical] |
| Pinned Tabs | A tab saved to one Space. It stays in the sidebar, never auto-archives, and keeps the URL it was pinned at. Pin with ⌘D (Ctrl-D on Windows) or by dragging above the line. | Pin exists: a pinned tab is smaller and shows only the site's icon. No stored URL to return to. | Yes. A pinned tab or a tab in the `Locked` group remembers the URL it had when locked; closing it reopens it in place at that URL. | [Pinned Tabs][pinned], [Chrome tabs][c-tabs] |
| Reset a Pinned Tab | Clicking the tab's icon, or ⌘T then "Reset Tab", returns a Pinned Tab or Favorite to its pinned URL. A slash next to the tab's name marks a tab that has left it. Right-click, "Edit Pinned Page", "Replace Pinned URL with Current" changes the stored URL. | None found. | Yes. ⌃R resets the current locked tab to its locked URL. "Replace pinned URL with current" makes the current page the locked URL. | [Pinned Tabs][pinned], [Slash next to a pinned tab][slash], [Pinned Tabs reverting][reverting] |
| Pinned Tabs keep you on the site | The Pinned Tabs article says a pinned site can be navigated anywhere within itself, and "clicking a link that would change the tab will open a Peek window". | None found. Links follow the page's own target. | Yes, for links that would open a new tab from a locked tab: they open as peek browsers. | [Pinned Tabs][pinned], [Peek][peek] |
| Favorites | Up to 12 tabs shown as icons at the very top of the sidebar, available in every Space. Favorites belong to a Profile. | None found. Pinned tabs belong to one window. | Not in README: unknown. | [Favorites][favorites], [Profiles][profiles] |
| Folders | Pinned Tabs can be grouped in folders. Tabs in folders do not auto-archive. Folders can be nested (Dia's import article mentions "Folders inside other folders"). A folder's icon can be changed (macOS note, November 17, 2023). | Tab groups: named, colored, collapsible, saved and synced through the Google Account. A closed group stays in the bookmarks bar or the Tab groups menu. Nesting: none found. | Partly. A tab group named `Locked` holds locked tabs. No folder features are claimed. | [Folders][folders], [Move from Arc to Dia][todia], [macOS 2023 notes][mac2023], [Chrome tabs][c-tabs] |
| Folder preview (macOS) | Hovering a closed folder's title lists and searches its tabs. A tab opened this way shows under the closed folder without unfolding it. | None found. | Not in README: unknown. | [Folders][folders], [macOS 2023 notes][mac2023] |
| Unpinned tabs and Auto Archive | Idle unpinned tabs are archived on a timer, 12 hours by default. Viewing a tab resets its timer. The timing is set per Profile. "Auto Archive can't be disabled." | None found. Memory Saver deactivates unused tabs to free memory and leaves them in the tab strip. | Not in README for tabs: unknown. Mini browsers close after 12 hours unfocused. | [Auto Archive][autoarchive], [Chrome performance][c-memory] |
| Archive | Closed and auto-archived tabs are kept, searchable, and restorable from ⌘T "View Archive" or the Library. "Clear Archive" empties it. | Chrome's History page and recently closed tabs (unverified against a Chrome page for this document). | Not in README: unknown. | [Auto Archive][autoarchive], [Library][library] |
| New tabs at the top | Unpinned tabs, which Arc calls Today Tabs, sit below the New Tab button. That a new tab is placed first in that list is unverified: no Arc page I read states it. | New tabs open at the end of the tab strip, or beside the tab that opened them (unverified against a Chrome page for this document). | Yes. The README lists "new tabs at the top" among the Arc behaviors it reproduces, with a switch in Settings, Tabs. | [Arc Max][max] |
| Collapse Pinned Tabs (macOS) | A caret next to the Space title hides the pinned section without hiding the sidebar. | Tab groups collapse to their name. No collapse for pinned tabs found. | Not in README: unknown. | [Pinned Tabs][pinned], [Chrome tabs][c-tabs] |
| Duplicate by dragging (macOS) | Holding Option while dragging a tab duplicates it in the sidebar. Right-click has "Duplicate" on both platforms. | "Duplicate" in the tab menu (unverified against a Chrome page for this document). Option-drag: none found. | Not in README: unknown. | [Pinned Tabs][pinned] |
| Hide the sidebar | ⌘S hides and shows the sidebar. | The vertical tab bar collapses. The README binds this to ⌘S through a macOS App Shortcut, which implies Chrome has a menu item and no ⌘S default. | Yes. ⌘S collapses or shows the vertical tab bar; Save Page As moves to ⇧⌘S. | [Hide the sidebar][hidesidebar], [Keyboard Shortcuts][shortcuts] |

## Spaces and Profiles

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Spaces | Separate browsing areas in one window. Each has its own pinned section, unpinned section, theme and icon. | None found. Tab groups and separate profile windows are the nearest features. | Not reproduced as Spaces. Hotkeys switch between Chrome profiles, each in its own window. | [Spaces][spaces] |
| Switching Spaces | Click the Space's icon at the bottom of the sidebar, two-finger swipe on the sidebar, Control-number (Alt-number on Windows), or type the name in the command bar. | Profiles switch through the profile menu, each opening its own window. No swipe or number keys found. | Partly, for profiles: ⌃⌥→ and ⌃⌥← step through Chrome profiles, ⌃⌥1 to 9 pick one by position, and a HUD shows them. | [Spaces][spaces] |
| Profiles attached to Spaces | A Profile scopes logins, cookies, history, cache, extensions, Favorites, archive timing, default browser choice and `arc://settings` to one or more Spaces. Several Spaces can share one Profile. Profiles do not sync across devices. | Profiles exist, one or more windows each. They are not combined in one window. | Works with Chrome's own profiles. Each profile needs the extension loaded; the app holds one connection per profile. | [Profiles][profiles] |
| Per-Space theme and icon | Each Space has a color theme and an icon or emoji. See Theming. | Themes apply per profile (unverified). | Not in README: unknown. | [Spaces][spaces] |
| Drag tabs between Spaces | A tab can be dragged left or right into another Space, or moved with right-click "Move to". | "Move tab to another window", within the same profile only. | Partly: a mini browser can be moved into another profile as a new tab. Moving ordinary tabs between profiles is not in the README. | [macOS 2022 notes][mac2022], [Chrome tabs][c-tabs] |
| Space Manager and Spaces view | ⌘T "Manage Spaces" edits and reorders Spaces. The Library's Spaces section shows and moves tabs across all Spaces. | None found. | Not in README: unknown. | [macOS 2022 notes][mac2022], [Library][library] |

## Sharing

The sharing article states that it applies to Arc for macOS and not Arc for Windows.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Share a Space, folder, Split View or selected tabs | Creates a link to a snapshot of the contents. Arc users can add it to their sidebar; other browsers show it as a page. The snapshot does not update, and the article says a shared link "cannot be deleted". | Shared tab groups: unverified. None found in the pages read. | Not in README: unknown. | [Share Spaces, Folders and Splits][share] |
| Share Quote | Selecting text on a page offers "Share Quote", which copies a link to the page with an image showing the quote. | "Copy link to highlight" (unverified against a Chrome page for this document). No quote image found. | Not in README: unknown. | [Share Spaces, Folders and Splits][share] |

## Split View

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Split View | Several tabs side by side or top and bottom in one window. The Split View article gives ⌘⇧+ on macOS and Ctrl-Shift-+ on Windows; the Keyboard Shortcuts article gives Control-Shift-+ for both. A tab can also be dragged from the sidebar into the page area on macOS. Command bar actions add a split to the right, left, top or bottom. | Split view shows 2 sites in one window, side by side or stacked, with an active and an inactive view. Introduced in Chrome 145 in February 2026. Extensions can create and manage splits from Chrome 155. | Not in README: unknown. | [Split View][split], [Keyboard Shortcuts][shortcuts], [Chrome split view][c-split], [Split View API][c-splitapi] |
| A split is one sidebar item | A Split View "becomes its own new tab in the sidebar that you can come back to later". A Split View made a Favorite can have a custom icon (macOS note, July 21, 2022). | The two tabs stay separate tabs that share a split id and must be adjacent with the same pinned, window and group state. | Not in README: unknown. | [Split View][split], [macOS 2022 notes][mac2022], [Split View API][c-splitapi] |
| Open a link in a split | "Option + Click on any link or tab will open it in Split View" (2021 release note; not rechecked against a later source). | Unverified. | Not in README: unknown. | [macOS 2021 notes][mac2021] |

## Peek and Previews

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Peek | A link clicked in a Pinned or Favorite tab opens in an overlay over the tab. On Windows since February 22, 2024. ⌘O (Ctrl-O) keeps it as a tab, a button moves it to a Split View, and a click outside, the X or ⌘W closes it. Can be turned off in Settings on macOS, and on Windows since a release note of June 20, 2024. | None found. | Yes. A link from a locked tab that would open a new tab opens as a mini browser over the window with the window behind it shaded. A click on the shade closes it; ⌘O keeps the page as a tab. | [Peek][peek], [Windows notes][win] |
| Previews (macOS) | Hovering a Pinned or Favorite tab shows a panel for supported sites: Gmail and Outlook mail, Google and Outlook calendars, GitHub, Notion, Confluence, Figma, Linear. Some offer actions such as joining a call or creating a page. | A tab hover preview card, with an optional page image on Windows, Linux and ChromeOS. No site-specific panels found. | Not in README: unknown. | [Previews][previews], [Chrome tabs][c-tabs] |
| Live Calendars | With Google Calendar as a Favorite, its icon shows a countdown to the next event and a "Join" button. | None found. | Not in README: unknown. | [Live Calendars][livecal] |
| GitHub Live Folders | A "Pull Requests" folder is created in the sidebar and filled with the user's pull requests from github.com, with filters by author, draft state and repository. | None found. | Not in README: unknown. | [Live Folders][livefolders] |

## Little Arc

The Little Arc article states that it applies to Arc for macOS and not Arc for Windows.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Little Arc window for outside links | A link clicked in another desktop app opens in a small window without the sidebar. | None found. Links open as a tab in the last used window. | Yes. Mini browsers are Chrome popup windows; a link from another app opens in one because the app is the default browser. | [Little Arc][littlearc] |
| New Little Arc from anywhere | ⌘⌥N from any app opens a Little Arc window for a search. | None found. | Yes, on a different key: ⌥⇧N from any app opens a mini browser with a search box. | [Little Arc][littlearc] |
| Open a tab or link in Little Arc | ⌘⌥-click on a tab opens it in Little Arc. A 2022 release note says ⌘⌥-click opens links in Little Arc. | None found. | Yes for links: ⌥⌘-click on any page opens the link in a mini browser. Needs the app. | [Little Arc][littlearc], [macOS 2022 notes][mac2022] |
| Move a Little Arc page into the sidebar | "Open In" button, ⌘O for the most recent Space, ⌘⌥O to choose a Space. | Popup windows have "Show as tab" (unverified). | Yes. ⌘O moves it into Chrome as a tab; ⇧⌘O picks the window, tab group or another profile. | [Little Arc][littlearc] |
| Little Arc windows archive themselves | Open Little Arc windows are archived after 6 hours by default; the interval is a setting. | None found. | Yes, at a different default: a mini browser left unfocused for 12 hours closes itself. | [Little Arc][littlearc] |
| Show or hide all Little Arc windows | Right-click the Dock icon: "Show/Hide All Little Arc Windows". | None found. | Not in README: unknown. | [Little Arc][littlearc] |
| Extensions and full-screen video in Little Arc | Extensions work in Little Arc, and video can go full screen there. | Not applicable. | Not in README: unknown. | [macOS 2022 notes][mac2022] |

## Link handling from other apps

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Air Traffic Control (macOS) | Rules send links to a Space. A rule matches when the URL "contains" a text or "is equal to" an address. | None found. | Yes, with more fields. Rules in `routes.json` match on host, path, whole URL and the sending app, and send the link to another app, a profile, a mini browser, a same-site tab, the front window or a tab group. | [Air Traffic Control][atc] |
| Default destination for outside links | Little Arc by default. Can be set to one Space or to "Most Recent Space". | The last used window. | Yes. A link no rule claims opens as a mini browser in the profile whose window is in front; the default is a setting. | [Air Traffic Control][atc] |
| Handoff from a phone | A tab open in mobile Safari or Chrome is offered in the Mac Dock to open in Arc. | Unverified. | Not in README: unknown. | [macOS 2022 notes][mac2022] |

## Boosts

The Boosts article states that it applies to Arc for macOS.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Boost editor | Per-site restyling without code: a color wheel, invert lightness ("dark mode" for the page), contrast, brightness and saturation sliders, a font picker, page size from 90% to 150%, and letter case. | None found built in. Extensions can do this. | Not in README: unknown. | [Boosts][boosts] |
| Zap | Click an element of a page to remove it on every visit. A control at the bottom of the page restores it. | None found built in. | Not in README: unknown. | [Boosts][boosts] |
| Custom CSS and JavaScript | A code editor attaches CSS and JavaScript to a site. Boosts can read the Space theme's colors. JavaScript Boosts were disabled once for all users and do not turn on automatically across devices. | None found built in. DevTools local overrides and extensions are the nearest tools (unverified). | Not in README: unknown. | [Boosts][boosts], [Disable Boosts][boostsoff], [macOS 2022 notes][mac2022] |
| Scope and switches | A Boost applies to one domain and to all Profiles. Each can be disabled from the Site Control Center, and all of them in Settings, Advanced. Boosts are listed in the Library. | Not applicable. | Not in README: unknown. | [Boosts][boosts], [Disable Boosts][boostsoff] |

## Easels and Capture

The Easels article states that Easels can be created and edited only on Arc for macOS.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Easels | A whiteboard page in the browser for drawing, text, images and captured parts of pages. New Easels open as a Pinned Tab. ⌃⇧E creates one. | None found. | Not in README: unknown. | [Easels][easels] |
| Capture | ⌘T "Capture", then drag a rectangle over part of the page. The capture can be added to a new or existing Easel. 2022 notes add: ⌘E or the camera icon in the address bar starts a capture, Capture selects page elements automatically, and the image can be edited and sent without leaving Arc. | Google Lens region selection for search. No capture-to-file tool found outside DevTools (unverified). | Not in README: unknown. | [Easels][easels], [macOS 2022 notes][mac2022] |
| Live Captures | A capture saved to an Easel can be made "Live" with a Play button: an interactive view of what was captured. Pause returns it to a still image. ⌘R on an Easel refreshes all Live Captures. Marked experimental when introduced in July 2022. | None found. | Not in README: unknown. | [macOS 2022 notes][mac2022] |
| Full-page capture (macOS) | ⌘T "Capture Full Page" saves a capture of the whole page to the default download location. A shortcut can be assigned. Holding Option while clicking "Capture the full page" in the Site Control Center uses Portrait Mode (note of June 6, 2024). | DevTools "Capture full size screenshot" (unverified against a Google page for this document). | Not in README: unknown. | [Full page captures][fullcapture], [Easels][easels], [macOS 2024 to 2026 notes][mac2024] |
| Share and export Easels | An Easel can be shared from a share button, has a Read Only option, is viewable in any browser, and can be exported as a PNG. | Not applicable. | Not in README: unknown. | [Easels][easels], [macOS 2022 notes][mac2022] |

## Notes

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Arc Notes (removed) | Notes written inside Arc, listed with Easels in the Library and shareable by link. Phased out in three steps: March 14, 2024 (export recommended), April 4, 2024 (view only), April 18, 2024 ("Arc Notes must be exported to view"). | None found. | Not in README: unknown. | [Phasing Out Arc Notes][notesout] |
| Default notes app (macOS) | ⌘T "New Note" creates a document in the service chosen per Profile under "New Documents": Notion, Google Docs, Word or Confluence. | None found. Typing `docs.new` in the address bar is a Google shortcut, not a Chrome feature. | Not in README: unknown. | [Customize Default Notes App][notesapp] |

## Library

The Library article states that it applies to Arc on macOS.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Library | One panel with five sections: Media (images, videos, screenshots, captures), Downloads, Easels and Notes, Spaces, and Archived Tabs. Opened from the icon at the bottom left of the sidebar or ⌘T "Open Library". | Separate Downloads and History pages. Side panel holds reading list, bookmarks and history. No combined panel found. | Not in README: unknown. | [Library][library] |
| Recent files on hover | Hovering the Library icon shows recent files, which can be opened or dragged out. The file types shown are selectable. Files drag out even when Arc is in the background. | A downloads bubble in the toolbar lists recent downloads (unverified). | Not in README: unknown. | [Library][library], [macOS 2022 notes][mac2022] |

## Mini Player and Picture-in-Picture

The Mini Player article states that it applies to Arc on macOS and Windows.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Mini Player (Picture-in-Picture) | Leaving a tab that is playing video moves the video into a floating player at the bottom right of the screen. It does not start for a muted tab. It can be resized from a corner, moved by scrolling over it on a trackpad, and controlled from the keyboard when selected (arrows seek, space plays or pauses). | Picture-in-Picture exists. Starting it automatically when the tab is left is behind `chrome://flags/#browser-initiated-automatic-picture-in-picture`, according to the README; I did not check this against a Google page. | Not reproduced by Monochrome itself. The README suggests turning on that Chrome flag, and has a setting for stopping the sites' own pop-out. | [Mini Player][miniplayer], [macOS 2022 notes][mac2022], [macOS 2023 notes][mac2023] |
| Audio Player in the sidebar | Leaving a tab that is playing audio shows a small controller at the bottom of the sidebar. An X closes it. Added to Windows on May 23, 2024. | None found in the tab strip. Chrome's toolbar media control is unverified. | Yes. A panel at the bottom of the sidebar shows artwork, title, artist, previous, play/pause, next and mute for a music tab that is not in front. A compact form shows when the sidebar is collapsed to icons. Works on nine sites. | [Mini Player][miniplayer], [Windows notes][win] |
| Video to audio hand-off | Closing the video Mini Player with its X on Windows keeps the audio playing in the Audio Player (note of June 6, 2024). On macOS the audio player has a "Back to PiP" button (note of November 30, 2023). | None found. | Not in README: unknown. | [Windows notes][win], [macOS 2023 notes][mac2023] |
| Turn off per site | Unchecking "Picture-in-Picture" in the Site Control Center stops the Mini Player for that site. | Site settings can block automatic picture-in-picture (unverified). | Partly: "Hide Player" on the panel's menu hides it until the music tab has been visited and left again. | [Disable Mini Player][miniplayeroff] |
| Mute from the sidebar | Clicking the audio icon on a tab in the sidebar mutes or unmutes it (Windows note, April 4, 2024). | Tab menu has "Mute site" (unverified against a Chrome page for this document). | Partly: the mini player has a speaker button that mutes the music tab. | [Windows notes][win] |

## Command bar and navigation

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Command Bar | ⌘T (Ctrl-T on Windows) opens one box over the window for addresses, searches, open tabs and browser actions. ⌘L opens it on the current tab's address. There is no New Tab page. | The address bar and the New Tab page. `@tabs` in the address bar searches open tabs, and Tab Search (⇧⌘A) lists them. | Yes, off by default. With the switches on, ⌘L and ⌘T open the app's command bar over the front window, with inline completion, open tabs as "Switch to tab", history, bookmarks and Google suggestions. | [Keyboard Shortcuts][shortcuts], [Chrome tabs][c-tabs] |
| Actions in the Command Bar | Typing a command runs it: Pin Tab, New Folder, New Boost, Capture, View Archive, Add Extension, "Move to" a Space, Settings, and the name of an extension. Typing `/` and a space filters for actions (macOS note, August 26, 2022). Added to Windows on January 25, 2024. | None found in the address bar. Chrome Actions in the address bar are unverified. | Not in the README's list of what the command bar shows: unknown. | [macOS 2022 notes][mac2022], [macOS 2023 notes][mac2023], [Windows notes][win], [Extensions][extensions] |
| Site Search (macOS article) | A shortcut, then Tab, then a query searches one site from the Command Bar. Entries are added in `arc://settings/searchEngines`, which is Chromium's settings page. | The same feature: site search shortcuts in Settings, used from the address bar. | Not in README: unknown. The command bar searches with Chrome's default search engine. | [Site Search][sitesearch], [Chrome site search][c-site] |
| Paste and Go | With a URL on the clipboard, "Paste and Go" is a top option in the Command Bar and on the New Tab button with ⌘ held (macOS note, October 19, 2023). | "Paste and go" in the address bar's context menu (unverified against a Chrome page for this document). | Not in README: unknown. | [macOS 2023 notes][mac2023] |
| Address shown in the sidebar | The URL sits at the top of the sidebar, with the Site Control Center beside it. An optional Toolbar across the top (⌘⇧D, macOS) can show the full URL. | A full-width toolbar with the address bar is always present. | Does not replace the address bar. | [Full URL][fullurl] |
| Site Control Center | One menu beside the URL holds extensions, the site's Boost, Picture-in-Picture, Developer Mode, Capture and site settings. | Separate controls: the site information button, the Extensions menu, DevTools. | Not in README: unknown. | [Extensions][extensions], [Boosts][boosts], [Developer Mode][devmode] |
| Tab history | ⌘Y on macOS and Ctrl-H on Windows open history, from the Archive menu. | History page: Ctrl-H on Windows per Chrome's shortcut page. | The command bar reads the last 90 days of history, up to 5000 pages. | [Tab history][tabhistory], [Chrome shortcuts][c-keys] |
| Copy URL and Copy URL as Markdown | ⌘⇧C copies the current tab's URL. A 2021 note calls this Supercopy and says it drops tracking parameters; later notes say it removes Amazon trackers. With several tabs selected it copies all their URLs. ⌘⇧⌥C copies the URL as Markdown (Ctrl-Shift-Alt-C on Windows). | None found in Chrome's shortcut list. | Not in README: unknown. | [Keyboard Shortcuts][shortcuts], [macOS 2021 notes][mac2021], [macOS 2022 notes][mac2022], [macOS 2024 to 2026 notes][mac2024] |
| Full URL on hover | Hovering a link for 1.5 seconds shows its whole URL in the status bar (macOS note, April 20, 2023). | The status bubble shows the link's URL (unverified). | Not in README: unknown. | [macOS 2023 notes][mac2023] |
| Undo sidebar changes | ⌘Z (Ctrl-Z on Windows) undoes archiving or moving tabs in the sidebar, and reopens a closed Peek. | ⌘⇧T reopens closed tabs. Undo for moving tabs: none found. | Not in README: unknown. | [macOS 2021 notes][mac2021], [macOS 2023 notes][mac2023], [Windows notes][win] |

## Arc Max

Arc Max is a set of optional AI features, introduced on macOS on October 5, 2023 as "an experimental suite of AI features" and on Windows on July 11, 2024. The Arc Max article says the features send data to AI partners and are free. A capture of that article from January 2026 marks five of the six listed features "macOS only". A company can turn Arc Max off with the Chromium enterprise policy `arcMaxDisabledByOrgPolicy` (macOS note, March 28, 2024).

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| 5-Second Previews (macOS) | Shift and hover over a link shows a generated summary of the page. On Google, DuckDuckGo and Bing results, X, Threads and Hacker News, hover alone does it. The card can be copied as text or as an image. | Gemini in Chrome answers questions about open tabs from a side panel. A summary on link hover: unverified. | Not in README: unknown. | [Arc Max][max], [macOS 2023 notes][mac2023] |
| Tidy Tab Titles (macOS) | A tab is renamed with a shorter title when it is pinned. Double-click renames it by hand. | None found. | Not in README: unknown. | [Arc Max][max] |
| Tidy Downloads (macOS) | Downloaded files are renamed automatically. Clicking the name undoes it. | None found. | Not in README: unknown. | [Arc Max][max] |
| ChatGPT in the Command Bar (macOS) | ChatGPT appears among search suggestions, and ⌘⌥G asks it a question. It needs a ChatGPT account signed in on that Profile. | Gemini in Chrome in a side panel. Chrome's site search page mentions Gemini among the search entries; the exact address bar shortcut is unverified. | Not in README: unknown. | [Arc Max][max], [Gemini in Chrome][c-gemini], [Chrome site search][c-site] |
| Instant Links (macOS) | Shift-Enter after a search in the Command Bar opens the top result directly. Several queries open several tabs, and "Folder of" before a query makes a folder of tabs. The Shift-Enter hint was removed from the Command Bar on June 13, 2024; the shortcut stayed. | None found. Auto browse in Gemini in Chrome carries out multi-step tasks, which is a different feature. | Not in README: unknown. | [Arc Max][max], [macOS 2024 to 2026 notes][mac2024], [Gemini auto browse][c-gemini] |
| Tidy Tabs | A broom icon above the unpinned tabs sorts them into named groups when there are more than six. It affects only Today Tabs. On macOS from February 8, 2024 and on Windows from July 11, 2024. | Chrome's "Organize tabs" is unverified. | Not in README: unknown. | [Arc Max][max], [Windows notes][win] |
| Ask on Page (removed) | ⌘F (Ctrl-F on Windows) could ask a question about the current page when the find had no match. "Ask On Page has been removed from Arc Max" on August 28, 2025. | Gemini in Chrome's side panel gives "context-aware help, based on your open tabs". | Related: ⌥⇧R opens a reader with a summary written by Apple's on-device model. It does not answer questions. | [macOS 2023 notes][mac2023], [macOS 2024 to 2026 notes][mac2024], [Windows notes][win], [Gemini in Chrome help][c-gemhelp] |
| Browse for Me | Named in Arc's notes only as a feature of the Arc Search mobile app. I found no desktop version. | Not applicable. | Not applicable. | [macOS 2024 to 2026 notes][mac2024] |

## Downloads

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Download location per Profile | Settings, Profiles sets the download folder for each Profile. | A download location per profile in Settings (unverified against a Chrome page for this document). | Not in README: unknown. | [Download location][dlloc] |
| Downloads in the Library | Downloads are a section of the Library, and recent files show when hovering the Library icon. See Library. On Windows, Ctrl-J opens a Downloads menu whose files can be dragged into pages. | A Downloads page and a toolbar list. | Not in README: unknown. | [Library][library], [Windows notes][win] |
| Tidy Downloads | See Arc Max. | None found. | Not in README: unknown. | [Arc Max][max] |

## Sync and Arc account

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Arc Sync | With sync on, Spaces, folders and tabs follow the Arc account to other devices. It is end-to-end encrypted, and a Recovery Card restores access after a password reset with no other synced device. It replaced iCloud sync, deprecated in version 1.48.0 on June 20, 2024. On Windows since March 21, 2024. | Chrome sync through a Google Account, including saved tab groups. | Does not touch Chrome's sync. | [Arc Sync][sync], [Windows notes][win], [Chrome tabs][c-tabs] |
| What does not sync | Browsing history, passwords, extensions, Favorites, Profiles, custom keyboard shortcuts and Air Traffic Control settings. | Chrome sync covers history, passwords and extensions (unverified against a Chrome page for this document). | Not applicable. | [Arc Sync][sync] |
| Same tabs in every window | A tab opened in a Space appears in that Space in every Arc window. A separate set of tabs needs a "Blank Window", made from the Command Bar or by dragging a tab out of the sidebar. | Each window has its own tabs. | Not in README: unknown. | [Same tabs across windows][samewin] |
| Arc account | An Arc account holds a name, email address and password, and is deactivated at the sunset. New accounts stopped on October 22, 2026. Whether Arc can be used without signing in is unverified. | A Google Account is optional (unverified against a Chrome page for this document). | The README mentions no account. | [Manage Your Arc Account][account], [Arc Sunset][sunset] |
| Sidebar backups (macOS) | Help, Restore Data restores the sidebar from local backups: 10 for the current day, 1 for each of the past 10 days, 1 a week for the prior month, 1 a month for the prior year. | "Continue where you left off" and history. No dated backups of the tab strip found. | Not in README: unknown. | [Restore tabs][restore] |
| Export | A help article explains exporting data from Arc. Easels can be saved all at once from the Easel Library (macOS note, October 29, 2026). | Not applicable. | A one-time script merges Arc's last 90 days of history and its form autofill into Chrome. | [Export from Arc][export], [macOS 2024 to 2026 notes][mac2024] |

## Privacy and ad blocking

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Privacy statements | The Privacy page says: "We don't know which websites you visit", "We don't see what you type into the browser", "We don't sell your data to third parties". Arc Max features send data to AI partners. | Not compared. | The README says what typed text goes to Google: the command bar's search suggestions. Details are in `docs/privacy.md`, which I did not read. | [Privacy and Security][privacy], [Arc Max][max] |
| Ad blocker installed by default | "Arc for macOS installs the uBlock Origin extension ad blocker by default." Import keeps only one ad blocker, and Arc prompts to remove a redundant one. YouTube was added to uBlock Origin's trusted sites on November 2, 2023, as a staged rollout. | No ad blocker is installed. Manifest V2 extensions, which include the original uBlock Origin, are disabled for all users from Chrome 138, and the remaining ones left the Chrome Web Store on August 31, 2026. | Not in README: unknown. | [Troubleshooting][trouble], [macOS 2023 notes][mac2023], [Chrome MV2 timeline][c-mv2] |
| Built-in content blocker | The Manifest V3 article says uBlock Origin and similar extensions "either already don't work in Arc or soon won't" and that a built-in content blocker "should be rolled out to everyone in the very near future". Whether it shipped is unverified: I found no release note for it. | None found. | Not in README: unknown. | [Ad blocking and Manifest V3][mv3] |
| Incognito | ⌘⇧N (Ctrl-Shift-N) opens an Incognito window. It is Chromium's. The Dock menu has "New Incognito Window". | The same. | Not in README: unknown. | [Incognito][incognito], [macOS 2022 notes][mac2022] |
| Passwords and autofill | Chromium's password manager and autofill, kept per Profile. Passwords do not sync through Arc Sync. | Google Password Manager, synced through the Google Account. | Does not touch Chrome's passwords. | [Saved passwords][passwords], [Autofill][autofill], [Arc Sync][sync] |

## Theming

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Space themes | The Theme Picker sets a color theme per Space, from the edit button beside the Space's name or a right-click on the sidebar. "Space Themes V2" (September 1, 2022) added presets and dark mode. Gradient themes sync from macOS to Windows. The minus button clears all colors to restore the default. | Chrome themes and colors, set per profile (unverified against a Chrome page for this document). | Not in README: unknown. | [Spaces][spaces], [macOS 2022 notes][mac2022], [Windows notes][win], [Restore default theme][themereset] |
| Light, dark or automatic (macOS) | The Theme Picker's stars, sun and moon set Automatic, Light or Dark for all Spaces. | A light, dark or device mode in Appearance settings (unverified). | Not in README: unknown. | [Spaces][spaces] |
| Theme used elsewhere | The Tab Switcher, toast notifications, Easel icons and menus take the Space's theme. Boosts can read the theme's colors as CSS variables. | Not applicable. | Not in README: unknown. | [macOS 2022 notes][mac2022], [macOS 2023 notes][mac2023], [macOS 2024 to 2026 notes][mac2024] |
| Window material (Windows) | Settings, Appearance offers Mica or Acrylic as the window background (note of March 21, 2024). | None found. | Not applicable: Monochrome is a Mac app. | [Windows notes][win] |
| Space and folder icons | A Space has an icon or emoji; a folder's icon can be changed. | Tab groups have a name and a color. | Not in README: unknown. | [Spaces][spaces], [macOS 2023 notes][mac2023] |

## Keyboard shortcuts

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| ⌃Tab by recent use | Control-Tab toggles between recent tabs and, held, shows the Tab Switcher for the five most recently visited tabs. W with Control held closes a tab from the switcher. | Ctrl-Tab is "Jump to the next open tab" on Windows and Linux; the Mac key is ⌘⌥→. No recency order in Chrome's shortcut list. | Yes. ⌃Tab and ⌃⇧Tab go to the last used tab in the window; holding ⌃ shows a switcher with thumbnails. | [Switch tabs quickly][switchtabs], [macOS 2022 notes][mac2022], [macOS 2023 notes][mac2023], [Chrome shortcuts][c-keys] |
| Tabs in sidebar order | ⌘⌥↑ and ⌘⌥↓ (Ctrl-Alt-↑ and ↓ on Windows) step through all tabs in the order listed. | ⌘⌥→ and ⌘⌥←. | Yes. The app sets ⌥⌘↓ and ⌥⌘↑ as macOS App Shortcuts for Chrome's next and previous tab. | [Switch tabs quickly][switchtabs], [Chrome shortcuts][c-keys] |
| Go to tab N | ⌘1, ⌘2 and so on go to the Nth sidebar item. Favorites can be left out of the count (macOS note, October 6, 2022). | ⌘1 to ⌘8 jump to a tab, ⌘9 to the last. | Not in README: unknown. | [Keyboard Shortcuts][shortcuts], [macOS 2022 notes][mac2022], [Chrome shortcuts][c-keys] |
| Space shortcuts | Control-1, 2, 3 focus Space N (Alt-N on Windows). ⌘⌥← and ⌘⌥→ switch Spaces. | None: Chrome has no Spaces. | For profiles: ⌃⌥1 to ⌃⌥9, ⌃⌥← and ⌃⌥→. | [Keyboard Shortcuts][shortcuts] |
| Pin, sidebar and clear | ⌘D pins or unpins the current tab, ⌘S shows or hides the sidebar, ⌘⇧K clears unpinned tabs. | ⌘D bookmarks the page and ⌘S saves it (unverified against Chrome's shortcut page, which I filtered and did not read in full). | ⌘S collapses the tab bar. ⌃R resets a locked tab. ⌘D and ⌘⇧K are not in the README. | [Keyboard Shortcuts][shortcuts] |
| Split View shortcuts | Control-Shift-+ adds a split, Control-Shift-minus closes it, Control-Shift-1, 2 and so on move focus between panes. | None found in Chrome's shortcut list. | Not in README: unknown. | [Keyboard Shortcuts][shortcuts], [Chrome shortcuts][c-keys] |
| Custom shortcuts (macOS) | Settings, Shortcuts remaps any listed shortcut. Not supported on Arc for Windows. | No shortcut editor found for browser commands. Extension commands are editable at `chrome://extensions/shortcuts`. | Sets a few through macOS App Shortcuts; its own keys have switches in Settings. | [Custom shortcuts][customkeys] |
| Esc and full screen (macOS) | Esc defaults to "Prefer Websites" so it does not leave full screen; holding or double-pressing Esc exits (notes of October 5 and November 2, 2023). | None found. | Not in README: unknown. | [Esc and full screen][esc], [macOS 2023 notes][mac2023] |
| Extension shortcuts | ⌘E held cycles through extensions; typing an extension's name in the Command Bar opens it. | Extension commands at `chrome://extensions/shortcuts`. | Not in README: unknown. | [Extensions][extensions] |

## Developer Mode

The Developer Mode article states that it applies to Arc for macOS and not Arc for Windows.

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Developer Mode | A per-tab mode with the full URL bar across the top, developer shortcuts and a yellow and black outline when focused. It turns on automatically for localhost sites and installs the JSON Formatter extension. | None found. DevTools opens by menu or shortcut on any tab. | Not in README: unknown. | [Developer Mode][devmode] |
| Portrait Mode capture | A screenshot button in the Developer Mode toolbar, or ⌘T "Capture in Portrait Mode", takes a styled screenshot. | None found. | Not in README: unknown. | [Developer Mode][devmode] |
| Undocked DevTools shortcut | ⌘⌥I brings undocked DevTools into focus (note of October 5, 2023). | ⌘⌥I opens DevTools (unverified against a Chrome page for this document). | Not in README: unknown. | [macOS 2023 notes][mac2023] |

## Importing from other browsers

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Import | Arc, Import from Another Browser imports from Chrome, Safari, Firefox, Brave, Edge, Opera, Opera GX and Vivaldi. Depending on the browser it brings bookmarks, passwords, history and extensions. Imported bookmarks become Pinned Tabs. | Chrome imports bookmarks and settings from other browsers (unverified against a Chrome page for this document). | The reverse direction only: `migrate/arc-to-chrome.sh` merges Arc's last 90 days of history and its form autofill into Chrome, once. | [Import][import] |
| Extension import | Extensions import from Chrome, Brave and Edge. | Not applicable. | Not in README: unknown. | [Extensions][extensions] |
| Windows additions | On Windows, import can target a specific Arc Profile and can bring cookies (note of February 29, 2024). | Not applicable. | Not applicable. | [Windows notes][win] |

## Extensions compatibility

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Chrome extensions | "Arc for desktop is a Chromium-based browser and is compatible with Chrome extensions". They are added from the Command Bar ("Add Extension") or the Extensions menu. | Native. | Monochrome is itself a Chrome extension plus an app. | [Ad blocking and Manifest V3][mv3], [Extensions][extensions] |
| Where extensions show | In the Site Control Center beside the URL. Pinned extensions show when the sidebar is hovered, or at the top right with the Toolbar on (⌘⇧D). On Windows they are at the top right by default. | The Extensions menu and pinned icons in the toolbar. | Not in README: unknown. | [Extensions][extensions], [Pinned extensions][pinext] |
| Extensions per Profile | Extensions belong to a Profile and do not sync. | Extensions belong to a profile and sync with the Google Account (sync unverified). | The extension is loaded in each Chrome profile. | [Profiles][profiles], [Arc Sync][sync] |
| Manifest V2 | Arc follows Chromium, so Manifest V2 extensions stop working there as well. | Disabled for all users from Chrome 138. | Not applicable. | [Ad blocking and Manifest V3][mv3], [Chrome MV2 timeline][c-mv2] |

## Arc for Windows differences

Arc for Windows release notes begin on December 11, 2023. Members of Arc for macOS could sign in without an invite from March 28, 2024. A Help Center article says "Arc for Windows is now available for the general public"; the date of general availability is unverified. Windows 10 (version 19H1 and newer) is supported from August 1, 2024 and ARM processors from October 10, 2024.

| Feature | On Arc for Windows | Source |
|---|---|---|
| Spaces, Profiles, Pinned Tabs, Favorites, folders, Auto Archive | Present. The Spaces, Profiles and Peek articles say they apply to macOS and Windows. | [Spaces][spaces], [Profiles][profiles] |
| Split View | Present. Vertical splits were added on May 23, 2024, drag-to-split on February 15, 2024. | [Windows notes][win] |
| Peek | Added on February 22, 2024. A setting to turn it off was added on June 20, 2024. | [Windows notes][win] |
| Mini Player and Audio Player | Automatic Picture-in-Picture from March 14, 2024. Audio Player from May 23, 2024. | [Windows notes][win] |
| Arc Sync | From March 21, 2024, end-to-end encrypted only. | [Windows notes][win], [Arc Sync][sync] |
| GitHub Live Folders | Added on June 6, 2024. | [Windows notes][win] |
| Arc Max | Introduced on July 11, 2024 with Tidy Tabs and Ask on Page. The Arc Max article marks 5-Second Previews, Tidy Tab Titles, Tidy Downloads, ChatGPT in the Command Bar and Instant Links "macOS only". | [Windows notes][win], [Arc Max][max] |
| Little Arc | Absent: the shortcut list gives "n/a" for Windows, and the article says it does not apply to Windows. | [Keyboard Shortcuts][shortcuts], [Little Arc][littlearc] |
| Boosts, Easels, Library, Previews, Site Search article, Developer Mode, Air Traffic Control, sharing | The articles for each say they apply to macOS, or to macOS and not Windows. I found no Windows release note adding them, with two exceptions: a note of June 6, 2024 mentions dragging downloads from "the Sidebar library (bottom left corner)", and a note of April 4, 2024 removed "Share Folder" from the menu because sharing "is not yet supported on Arc for Windows". | Each article, cited in its category above |
| Custom keyboard shortcuts | "Not currently supported on Arc for Windows." | [Custom shortcuts][customkeys] |
| Windows only | Mica or Acrylic window material, the Arc menu (Alt-F), mouse back and forward buttons switching Spaces, PDF files opened in Arc by default, running as administrator. | [Windows notes][win], [PDFs on Windows][pdf] |
| Language | Arc for desktop is available only in English on both platforms. | [Languages][languages] |

## Other behavior found in the sources

| Feature | What Arc does | Chrome, November 2026 | Monochrome (README) | Source |
|---|---|---|---|---|
| Switch the shared tab in Google Meet (macOS) | During a call, hovering a tab in the sidebar shows "Share this tab instead". The shared tab is highlighted yellow. | Chrome's own tab sharing bar has a switch control (unverified). | Not in README: unknown. | [Share tab in Meet][meet] |
| Translation | Chromium's Google Translate prompt appears in the URL bar. Right-click translates a page by hand on macOS. | The same feature. | Not in README: unknown. | [Translation][translate] |
| HTTPS upgrades | Chromium's "Always use secure connections" setting, at `arc://settings/security`. | The same setting. | Not in README: unknown. | [HTTPS redirects][https] |
| Progressive Web Apps | "Arc for Desktop does not have support for Progressive Web Apps (PWAs)." Favorites are the suggested substitute. This is a feature Chrome has and Arc lacks. | Chrome installs web apps (unverified against a Chrome page for this document). | Not in README: unknown. | [PWAs][pwa] |
| Membership card | A card for the Arc member in Settings, to view, download or customize (macOS note, July 28, 2022). | None. | Not in README: unknown. | [macOS 2022 notes][mac2022] |
| Recent Tab indicator (removed) | A highlight on the last tab's icon, added October 19, 2023 and removed February 29, 2024. | None found. | Not in README: unknown. | [macOS 2023 notes][mac2023], [macOS 2024 to 2026 notes][mac2024] |

## Not verified

- Whether Arc places a new tab first in the unpinned list. The README says Monochrome puts new tabs at the top "the way Arc did"; no Arc page I read states the rule.
- Whether Arc can be used without an Arc account.
- Whether Arc shipped the built-in content blocker its Manifest V3 article promised.
- The date Arc for Windows became generally available.
- The acquisition price from Atlassian's own filing. The sec.gov page refused the request; $610 million in cash is from TechCrunch, with the same figure in Reuters and CNBC headlines.
- Option-click opening a link in Split View, and Handoff from a phone: each rests on one release note from 2021 or 2022 and was not rechecked against a later source.
- Chrome behavior marked "unverified" in the tables: recently closed tabs and History as an archive, "Duplicate", "Copy link to highlight", shared tab groups, "Show as tab", DevTools overrides and full-size screenshots, Google Lens capture, the downloads list, automatic picture-in-picture and its site setting, the toolbar media control, "Mute site", Chrome Actions, "Paste and go", the status bubble, link hover summaries, "Organize tabs", the Gemini address bar shortcut, what Chrome sync covers, per-profile download location and themes, light and dark mode, ⌘D and ⌘S defaults, ⌘⌥I, import, web app install, and the tab sharing bar. None of these was read on a Google page for this document.
- Chrome's split view on vertical tabs, and whether Chrome's reading mode differs from the one in its side panel. The Chrome blog post announces "immersive reading mode" without detail I recorded.
- Anything about Monochrome beyond `README.md`. The files under `docs/` were not read.
- The feature articles are Wayback captures from December 2024 to April 2026. Arc may have changed after a capture; the release notes show only Chromium and security updates in 2026, apart from the Easel export of October 29, 2026.
- Reviews were not used. Every Arc claim is from The Browser Company's own pages.

## Sources

Arc, live on resources.arc.net on 2026-11-26:

- [Arc Sunset: Key Dates and What to Expect][sunset]
- [Move from Arc to Dia][todia]
- [Manage Your Arc Account][account]
- [How Do I Export My Data from Arc?][export]
- [Privacy and Security][privacy]
- [Arc for macOS, 2024 to 2026 release notes][mac2024]
- [Arc for macOS, 2023 release notes][mac2023]
- [Arc for macOS, 2022 release notes][mac2022]
- [Arc for macOS, 2021 release notes][mac2021]
- [Arc for Windows, 2023 to 2026 release notes][win]

Arc, removed from the live Help Center and read from Wayback Machine captures: [Pinned Tabs][pinned], [Favorites][favorites], [Folders][folders], [Auto Archive][autoarchive], [Library][library], [Spaces][spaces], [Profiles][profiles], [Share Spaces, Folders and Splits][share], [Split View][split], [Peek][peek], [Previews][previews], [Live Calendars][livecal], [GitHub Live Folders][livefolders], [Little Arc][littlearc], [Air Traffic Control][atc], [Boosts][boosts], [Disable Boosts][boostsoff], [Easels][easels], [Phasing Out Arc Notes][notesout], [Customize Default Notes App][notesapp], [Full page captures][fullcapture], [Mini Player][miniplayer], [Disable Mini Player][miniplayeroff], [Arc Max][max], [Site Search][sitesearch], [Arc Sync][sync], [Keyboard Shortcuts][shortcuts], [Custom shortcuts][customkeys], [Switch tabs quickly][switchtabs], [Esc and full screen][esc], [Developer Mode][devmode], [Import][import], [Extensions][extensions], [Pinned extensions][pinext], [Incognito][incognito], [Ad blocking and Manifest V3][mv3], [Troubleshooting][trouble], [Arc for Windows][winarticle], [Slash next to a pinned tab][slash], [Pinned Tabs reverting][reverting], [Hide the sidebar][hidesidebar], [Same tabs across windows][samewin], [Share tab in Meet][meet], [Tab history][tabhistory], [Restore tabs][restore], [Restore default theme][themereset], [Full URL][fullurl], [Download location][dlloc], [Saved passwords][passwords], [Autofill][autofill], [Translation][translate], [HTTPS redirects][https], [PDFs on Windows][pdf], [Languages][languages], [PWAs][pwa].

The Browser Company and Atlassian:

- [Letter to Arc members 2025][letter], May 26, 2025
- [Welcoming The Browser Company to Atlassian][atl-blog]
- [Atlassian Completes Acquisition of The Browser Company of New York][atl-done], October 21, 2025
- [Atlassian to buy Arc developer The Browser Company for $610M][tc], TechCrunch, September 4, 2025

Chrome:

- [Get more done with new vertical tabs and immersive reading mode in Chrome][c-vertical], April 7, 2026
- [Use split view for multitasking in Chrome][c-split]
- [Split View API for extensions][c-splitapi]
- [Manage tabs in Chrome][c-tabs]
- [Chrome keyboard shortcuts][c-keys]
- [Set default search engine and site search shortcuts][c-site]
- [Personalize Chrome performance][c-memory]
- [Gemini in Chrome and auto browse][c-gemini]
- [Gemini in Chrome help][c-gemhelp]
- [Manifest V2 support timeline][c-mv2]

Monochrome: `README.md` in this repository.

[sunset]: https://resources.arc.net/hc/en-us/articles/44412972248471-Arc-Sunset-Key-Dates-and-What-to-Expect
[todia]: https://resources.arc.net/hc/en-us/articles/44413129117591
[account]: https://resources.arc.net/hc/en-us/articles/19401542261911
[export]: https://resources.arc.net/hc/en-us/articles/25583851606039
[privacy]: https://resources.arc.net/hc/en-us/articles/19434846038935
[mac2024]: https://resources.arc.net/hc/en-us/articles/20498293324823
[mac2023]: https://resources.arc.net/hc/en-us/articles/20498377604887
[mac2022]: https://resources.arc.net/hc/en-us/articles/20498417809815
[mac2021]: https://resources.arc.net/hc/en-us/articles/20498463803799
[win]: https://resources.arc.net/hc/en-us/articles/22513842649623
[letter]: https://browsercompany.substack.com/p/letter-to-arc-members-2025
[atl-blog]: https://www.atlassian.com/blog/company-news/atlassian-acquires-the-browser-company
[atl-done]: https://www.businesswire.com/news/home/20251021473486/en/Atlassian-Completes-Acquisition-of-The-Browser-Company-of-New-York
[tc]: https://techcrunch.com/2025/09/04/atlassian-to-buy-arc-developer-the-browser-company-for-610m/
[c-vertical]: https://blog.google/products-and-platforms/products/chrome/new-chrome-productivity-features/
[c-split]: https://support.google.com/chrome/answer/16971124?hl=en
[c-splitapi]: https://developer.chrome.com/blog/split-view-api-extensions
[c-tabs]: https://support.google.com/chrome/answer/2391819?hl=en&co=GENIE.Platform=Desktop
[c-keys]: https://support.google.com/chrome/answer/157179?hl=en&co=GENIE.Platform=Desktop
[c-site]: https://support.google.com/chrome/answer/95426?hl=en&co=GENIE.Platform=Desktop
[c-memory]: https://support.google.com/chrome/answer/12929150?hl=en
[c-gemini]: https://blog.google/products-and-platforms/products/chrome/gemini-3-auto-browse/
[c-gemhelp]: https://support.google.com/chrome/a/answer/17031592?hl=en
[c-mv2]: https://developer.chrome.com/docs/extensions/develop/migrate/mv2-deprecation-timeline
[pinned]: https://web.archive.org/web/20251202041552id_/https://resources.arc.net/hc/en-us/articles/19231060187159-Pinned-Tabs-Tabs-you-want-to-stick-around
[favorites]: https://web.archive.org/web/20251127144444id_/https://resources.arc.net/hc/en-us/articles/19230755904151-Favorites-Top-Tabs-Across-Every-Space
[folders]: https://web.archive.org/web/20241202081306id_/https://resources.arc.net/hc/en-us/articles/19228419623447-Folders-Stash-Similar-Tabs-Together
[autoarchive]: https://web.archive.org/web/20251127231753id_/https://resources.arc.net/hc/en-us/articles/19228855311127-Auto-Archive-Clean-as-you-go
[library]: https://web.archive.org/web/20260409042348id_/https://resources.arc.net/hc/en-us/articles/19230634389911-Library-A-home-for-your-downloads-archived-tabs-easels-and-more
[spaces]: https://web.archive.org/web/20251128111324id_/https://resources.arc.net/hc/en-us/articles/19228064149143-Spaces-Distinct-Browsing-Areas
[profiles]: https://web.archive.org/web/20251203220635id_/https://resources.arc.net/hc/en-us/articles/19227964556183-Profiles-Separate-Work-Personal-Browsing
[share]: https://web.archive.org/web/20251127185105id_/https://resources.arc.net/hc/en-us/articles/19228534606743-Share-Spaces-Folders-Splits-with-Anyone
[split]: https://web.archive.org/web/20250123020026id_/https://resources.arc.net/hc/en-us/articles/19335393146775-Split-View-View-Multiple-Tabs-at-Once
[peek]: https://web.archive.org/web/20241216122329id_/https://resources.arc.net/hc/en-us/articles/19335302900887-Peek-Preview-Sites-From-Pinned-Tabs
[previews]: https://web.archive.org/web/20251223131449id_/https://resources.arc.net/hc/en-us/articles/19335284431639-Previews-Glance-Top-Sites
[livecal]: https://web.archive.org/web/20250114042417id_/https://resources.arc.net/hc/en-us/articles/24158102740631-Live-Calendars
[livefolders]: https://web.archive.org/web/20260402162621id_/https://resources.arc.net/hc/en-us/articles/22731612065815-Automatic-GitHub-Live-Folders
[littlearc]: https://web.archive.org/web/20251208133126id_/https://resources.arc.net/hc/en-us/articles/19235387524503-Little-Arc-Quick-Lookups-Instant-Triaging
[atc]: https://web.archive.org/web/20260128150740id_/https://resources.arc.net/hc/en-us/articles/22932014625431-Air-Traffic-Control-Automate-Your-Link-Routing
[boosts]: https://web.archive.org/web/20260301173340id_/https://resources.arc.net/hc/en-us/articles/19212718608151-Boosts-Customize-Any-Website
[boostsoff]: https://web.archive.org/web/20250217082343id_/https://resources.arc.net/hc/en-us/articles/26681118599191-How-do-you-disable-Boosts
[easels]: https://web.archive.org/web/20251215214722id_/https://resources.arc.net/hc/en-us/articles/19231142050071-Easels-Capture-Create
[notesout]: https://web.archive.org/web/20250804063710id_/https://resources.arc.net/hc/en-us/articles/19233788518039-Phasing-Out-Arc-Notes
[notesapp]: https://web.archive.org/web/20251230051658id_/https://resources.arc.net/hc/en-us/articles/22557798824855-Customize-Default-Notes-App
[fullcapture]: https://web.archive.org/web/20241211033141id_/https://resources.arc.net/hc/en-us/articles/25481392111895-How-To-Take-Full-Page-Screen-Captures-in-Arc
[miniplayer]: https://web.archive.org/web/20250123005838id_/https://resources.arc.net/hc/en-us/articles/19234766331799-Mini-Player-Watch-or-Listen-as-you-Browse
[miniplayeroff]: https://web.archive.org/web/20250123005202id_/https://resources.arc.net/hc/en-us/articles/25590734716823-How-Do-You-Disable-Mini-Player-on-Arc-for-Desktop
[max]: https://web.archive.org/web/20260102042900id_/https://resources.arc.net/hc/en-us/articles/19335160678679-Arc-Max-Boost-Your-Browsing-with-AI
[sitesearch]: https://web.archive.org/web/20250116131619id_/https://resources.arc.net/hc/en-us/articles/20855018192791-Site-Search-Directly-Search-any-Website
[sync]: https://web.archive.org/web/20251215214733id_/https://resources.arc.net/hc/en-us/articles/20272860828823-Arc-Sync
[shortcuts]: https://web.archive.org/web/20251202071112id_/https://resources.arc.net/hc/en-us/articles/20595231349911-Keyboard-Shortcuts
[customkeys]: https://web.archive.org/web/20250804064433id_/https://resources.arc.net/hc/en-us/articles/25622899860631-How-to-Set-Custom-Keyboard-Shortcuts-on-Arc-for-Desktop
[switchtabs]: https://web.archive.org/web/20250908055935id_/https://resources.arc.net/hc/en-us/articles/25619402657303-How-Do-You-Switch-Between-Tabs-Quickly-on-Arc-Desktop
[esc]: https://web.archive.org/web/20250804060648id_/https://resources.arc.net/hc/en-us/articles/25619348451223-How-Do-I-Stop-the-Esc-Key-From-Exiting-Full-Screen-on-Arc-for-macOS
[devmode]: https://web.archive.org/web/20251008223739id_/https://resources.arc.net/hc/en-us/articles/20468488031511-Developer-Mode-Instant-Dev-Tools
[import]: https://web.archive.org/web/20250119144530id_/https://resources.arc.net/hc/en-us/articles/19335089616791-Import-Bookmarks-Logins-History-Extensions-from-Your-Previous-Browser
[extensions]: https://web.archive.org/web/20251217225634id_/https://resources.arc.net/hc/en-us/articles/19434259167767-Extensions-in-Arc-How-to-Import-Add-Open
[pinext]: https://web.archive.org/web/20250123005711id_/https://resources.arc.net/hc/en-us/articles/25625617866263-How-Do-You-Move-Your-Pinned-Extensions-to-the-Top-Right
[incognito]: https://web.archive.org/web/20250908065831id_/https://resources.arc.net/hc/en-us/articles/22354398337687-Open-Incognito-Window
[mv3]: https://web.archive.org/web/20251210003625id_/https://resources.arc.net/hc/en-us/articles/25540117353623-What-Happens-to-Ad-Blocking-in-Arc-when-Google-upgrades-to-Manifest-V3
[trouble]: https://web.archive.org/web/20251008221554id_/https://resources.arc.net/hc/en-us/articles/19335714372759-Basic-Troubleshooting-in-Arc
[winarticle]: https://web.archive.org/web/20260402162621id_/https://resources.arc.net/hc/en-us/articles/19400082392215-Arc-for-Windows
[slash]: https://web.archive.org/web/20251008230713id_/https://resources.arc.net/hc/en-us/articles/25625148480279-Why-is-There-a-Slash-Next-to-My-Pinned-Tab-s-Name
[reverting]: https://web.archive.org/web/20241211032106id_/https://resources.arc.net/hc/en-us/articles/25541939922199-Why-Are-My-Pinned-Tabs-and-Favorites-Reverting-Back-to-Their-Original-URL-in-Arc-for-Desktop
[hidesidebar]: https://web.archive.org/web/20241211034357id_/https://resources.arc.net/hc/en-us/articles/25619487530519-How-Do-You-Hide-the-Sidebar
[samewin]: https://web.archive.org/web/20251008223047id_/https://resources.arc.net/hc/en-us/articles/25590417429783-Why-Are-the-Same-Tabs-Appearing-Across-Multiple-Arc-Windows
[meet]: https://web.archive.org/web/20250908062941id_/https://resources.arc.net/hc/en-us/articles/25590627478935-How-Can-I-Quickly-Switch-the-Tab-I-m-Sharing-on-a-Google-Meet-Call
[tabhistory]: https://web.archive.org/web/20250908062901id_/https://resources.arc.net/hc/en-us/articles/25591309234199-How-Do-I-View-My-Tab-History-in-Arc-for-Desktop
[restore]: https://web.archive.org/web/20250908064645id_/https://resources.arc.net/hc/en-us/articles/25625071960215-How-Do-I-Restore-My-Tabs-on-Arc-for-Desktop
[themereset]: https://web.archive.org/web/20250123015902id_/https://resources.arc.net/hc/en-us/articles/25625261733143-How-Do-I-Restore-the-Default-Theme-for-Arc-for-Desktop
[fullurl]: https://web.archive.org/web/20250908055155id_/https://resources.arc.net/hc/en-us/articles/25625458052247-How-Do-You-View-the-Full-URL-at-the-Top-of-the-Page-in-Arc-for-Desktop
[dlloc]: https://web.archive.org/web/20250123002415id_/https://resources.arc.net/hc/en-us/articles/25614213458711-How-Do-You-Change-Your-Download-Location-in-Arc-for-Desktop
[passwords]: https://web.archive.org/web/20241211022730id_/https://resources.arc.net/hc/en-us/articles/25619249733783-How-Do-I-Find-My-Saved-Passwords-in-Arc-for-Desktop
[autofill]: https://web.archive.org/web/20241211034748id_/https://resources.arc.net/hc/en-us/articles/25592040479639-Does-Arc-for-Desktop-Have-an-Option-to-Autofill-Passwords-and-Payment-Information
[translate]: https://web.archive.org/web/20250123011005id_/https://resources.arc.net/hc/en-us/articles/25626093607703-How-Does-Translation-Work-on-Arc-for-Desktop
[https]: https://web.archive.org/web/20250123014800id_/https://resources.arc.net/hc/en-us/articles/25628125368087-How-Do-You-Turn-Off-https-Redirects-on-Arc-for-Desktop
[pdf]: https://web.archive.org/web/20241211035619id_/https://resources.arc.net/hc/en-us/articles/25628042954007-How-to-Open-pdf-Files-in-Arc-for-Windows-by-Default
[languages]: https://web.archive.org/web/20241211022005id_/https://resources.arc.net/hc/en-us/articles/25673646282263-Is-Arc-for-Desktop-Available-in-Languages-Other-Than-English
[pwa]: https://web.archive.org/web/20251008223920id_/https://resources.arc.net/hc/en-us/articles/25678978728983-Does-Arc-for-Desktop-Support-Progressive-Web-Apps
