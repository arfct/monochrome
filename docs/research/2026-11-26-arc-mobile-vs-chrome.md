# Arc on mobile compared with Chrome for iOS and Android

Date: 2026-11-26. Status: research. A sibling document covers Arc on the desktop.

This document lists what Arc's mobile apps did that Chrome for iOS and Chrome for Android did not, as of 2026-11-26, with a source for each item. Two apps are in scope. The first is the Arc companion app for iPhone, released on March 30, 2023 [1], listed first as "Arc | Mobile Companion" [2], later renamed Arc Sidebar Sync [3], and still listed on the App Store as "Sidebar Sync for Arc Members" at version 1.11.3 [4]. It showed the desktop Sidebar (Spaces, pinned tabs, folders) and was deprecated in 2024 in favour of Arc Search [3][5]. The second is Arc Search, a full browser released for iPhone on January 28, 2024 [6], extended to iPad on June 20, 2024 [7], released for Android as an open beta announced on October 3, 2024 [8], and made generally available on Android as version 1.0.0 on November 14, 2024 [9][10].

Arc is being shut down. The Browser Company stopped building features for Arc and moved to Dia, as stated in its letter of May 26, 2025 [11]. Atlassian completed its acquisition of the company on October 21, 2025 [12]. The sunset was announced on October 22, 2026 [13][14]. On November 23, 2026 the AI features in Arc Search (Browse for Me and the others) were turned off on both platforms and sign-in and sync stopped [13][15]. Call Arc had already been removed from the iOS app [15]. On December 22, 2026 Arc Search for Android is removed from Google Play and from the devices it is installed on, and all Arc accounts are deactivated. Arc Search for iOS continues to work as a browser without AI or sync [13]. The help centre states that Dia is available for macOS and Windows [15]; it names no iPhone or Android app. The companion app depends on the sync that stopped on November 23, so I read it as non-functional from that date; no source states this directly.

Three consequences follow for reading the tables. Every AI and sync feature below is described in the past tense because it ended three days before this document's date. Version numbers and dates come from Arc's own release notes unless another source is cited. The Chrome column states what Google's help pages and blog posts say today; where I did not read a Google source, the cell says so.

## How to read the tables

- Platform: where Arc shipped the feature. "iOS" includes iPad from version 1.18.0 [7].
- Chrome equivalent: the closest feature in Chrome for iOS or Android, or "None found" when the Google sources I read describe nothing comparable. "None found" is a statement about those sources, not a proof of absence.
- [unverified] marks a claim that rests on my own knowledge or on a search-result snippet and not on a page I read.


## Browse for Me (AI-built pages)

Browse for Me was the feature Arc Search was built around. It ended on November 23, 2026 [15].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Browse for Me | A button next to each search suggestion. Arc read web pages for the query (at least six at launch) and wrote a new page with sections and a list of the sources, each of which opened in a tab [6][16][5]. | Both | Partial. AI Mode is reachable from Chrome's New Tab page and address bar and answers in Google's own AI Mode interface [17]. Gemini in Chrome answers questions about the current page [18][19]. Neither is documented as building a standalone page from a query inside the browser. | [6][5] |
| Models | Launch coverage says the feature used models from OpenAI and others [6]. Version 1.20.1 (July 4, 2024) moved it to GPT-4o [7]. | iOS (Android model not stated) | Gemini models. Not comparable as a feature. | [7] |
| Toggle between Browse for Me and the search engine | A control at the bottom right of every results page switched between the AI page and the search engine's results. iOS 1.19.0 (June 27, 2024), Android 1.9.0 (February 21, 2025) [7][9]. | Both | Partial. Chrome on Android has an AI Mode button beside the search box on the New Tab page [17]. | [7][9] |
| Instant answers | Short direct answers for lookup queries such as unit and currency conversions. iOS 1.13.0 (May 16, 2024) [7]. | iOS | Google Search answers these on the results page. Chrome-specific behaviour not checked [unverified]. | [7] |
| List format | Queries whose results suit a list (the release note's example is "pizza in Washington DC") returned a list for comparison. iOS 1.12.0 (May 9, 2024) [7]. | iOS | None found as a browser feature. | [7] |
| Follow-up sections | Tapping a suggested follow-up under "Learn more" added sections to the same page. iOS 1.24.0 (August 1, 2024) [7]. | iOS | Partial. AI Mode and Gemini in Chrome take follow-up questions in a chat [17][18]. | [7] |
| Edit the query in place | The query could be edited from the page's own menu. iOS 1.12.0, with a redesigned loading screen and quick edit in 1.22.2 (July 18, 2024) [7]. | iOS | Standard in any search box. | [7] |
| Browse for Me from selected text | Highlighted text on a page could start a Browse for Me query. iOS 1.23.0 (July 25, 2024). On Android, 1.1.0 added searching text selected in other apps [7][9]. | Both (different forms) | Partial. Chrome on Android offers Translate on selected text [20]. A selected-text AI query is not described in the sources read. | [7][9] |
| Browse for Me from other apps | A share action opened a link in Arc Search or ran Browse for Me on shared text. iOS 1.16.0 (June 6, 2024) [7]. | iOS | None found. | [7] |
| Answer in the query's language | Browse for Me detected the query language and answered in it, with a list of languages and a "Browse for Me Language" setting [5]. Android 0.4.1 added inference from query text and 1.1.0 made it follow the Preferred Language setting [9]. iOS 1.33.0 fixed Traditional Chinese queries being answered in Simplified Chinese [7]. | Both | Gemini in Chrome requires a supported device language [19]. Per-query language detection not checked. | [5][9] |
| Right-to-left pages | Browse for Me pages displayed right-to-left languages. iOS 1.27.0 (August 22, 2024) [7]. | iOS | Not checked. | [7] |
| Sharing a Browse for Me page | From iOS 1.27.0 a shared link opened the live page in Arc and a static page elsewhere. Version 1.40.2 (January 30, 2025) disabled the Copy URL button for results, leaving screenshots as the way to share [7]. | iOS | Not comparable. | [7] |
| Feedback prompt | Result pages carried a "Did Arc answer your question" section. Its existence is known from a bug fix in iOS 1.24.0 [7]. | iOS | Not checked. | [7] |

## Search and default engine

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Keyboard-up launch | The app opened with the search field focused and the keyboard raised [5]. iOS 1.13.0 added a setting to turn this off [7]. | Both (setting documented on iOS) | None found. Chrome's iOS app icon offers quick actions for a new tab and Voice Search on long press [21]. | [5][7] |
| Default search engine choice | At launch the options were Google, Bing, DuckDuckGo and Ecosia [6]. | Both | Equivalent. Chrome lets the user pick a default engine [22]. | [6] |
| Custom search engines | User-defined engines. iOS 1.16.0 (June 6, 2024), Android 1.9.0 (February 21, 2025) [7][9]. | Both | Partial. Chrome on Android adds recently visited search engines as options [22]. Entering an arbitrary engine on mobile is not described there. | [7][9] |
| Results in the preferred language | Search results loaded in the device's preferred language (iOS 1.19.0), with host language parameters improved in 1.23.0. Android 0.5.0 added one Preferred Language setting for Browse for Me, Search and Translate [7][9]. | Both | Not checked. | [7][9] |
| Top Sites above the keyboard | Pinned sites appeared on the search sheet directly above the keyboard, with most-visited sites shown when nothing was pinned. Sites were pinned from the page menu and could be reordered by dragging [5][16][23]. | Both (reordering documented on iOS) | Partial. Chrome has New Tab page shortcuts that can be customized and synced [24]. Placement above the keyboard is not described. | [5][16] |
| Suggested first searches | New users saw starter queries after onboarding (iOS 1.13.0), later also in Japanese and Korean (1.28.0) [7]. | iOS | Not checked. | [7] |
| Usage tips | Tips based on how the app was used. iOS 1.30.0 (September 12, 2024) [7]. | iOS | Not checked. | [7] |

## Voice: Voice Search and Call Arc

Call Arc was removed from the iOS app before the November 23 cutoff [15]. No Android release note adds it, and launch coverage lists it as absent on Android [8][9].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Voice Search | Holding the plus button started a spoken search. iOS 1.11.0 (May 2, 2024); a microphone button in the search bar followed in 1.19.0. Android 1.0.0 added the long press and 1.1.0 added the search-bar button and a haptic tick for each recognized word [7][9]. | Both | Equivalent. Chrome has voice search on both platforms, and on Android it can be set as the toolbar shortcut [25][26]. | [7][9] |
| Call Arc | Raising the phone to the ear started a spoken exchange: the user asked a question and heard an answer, with an animated face on screen and follow-up questions allowed. "Read More" opened the full Browse for Me page. iOS 1.14.0 (May 23, 2024) [7][27]. | iOS | Partial. Gemini in Chrome is a chat box, opened by a tap [18]. The auto browse help page mentions "Live chats" as a separate mode [28]; I did not read its documentation. No raise-to-ear trigger is described. | [7][27] |
| Call Arc languages | Version 1.16.0 extended Call Arc to any language Siri supports, with transcription tied to the iOS system language, and reduced accidental activation [7]. | iOS | Not comparable. | [7] |
| Raise to Call setting and hold music | A "Raise to Call" toggle in Settings controlled the gesture. A reviewer reports hold music while the answer was prepared [23]. | iOS | None found. | [23] |

## Summaries and reading

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Pinch to Summarize | Pinching a page folded it and replaced it with an AI summary in bullet points, with haptic feedback. Released in February 2024 [29]. The same summary was available from "Summarize" in the page menu, and the gesture had a Settings toggle [23]. The reviewer found summaries incomplete on some pages and weak outside English [29]. | iOS | Partial. Gemini in Chrome offers a "Summarize page" suggestion in its chat box on both platforms, for signed-in users, outside Incognito, where the rollout has reached them [18][19]. No gesture. | [29][23] |
| Summarize button | Android 1.11.1 (April 25, 2025) added a Summarize button for tabs and improved summary headlines [9]. Android launched without summarization [8]. Whether the pinch gesture reached Android is not stated in the release notes. | Android | Same as above. Gemini in Chrome became available to all Android users in the U.S. on August 18, 2026 [30]. | [9] |
| Reader mode | A reader view for web pages, present at the iOS launch [6][16]. An October 2024 review lists it as missing on Android [31]; no later Android release note adds it. | iOS | Equivalent. Chrome has reading mode on iOS and Android with typeface, size and colour theme controls [32][33]. | [6][31] |
| Page translation | Pages were translated through Google Translate from the page menu, once or always, into the app's language setting. iOS 1.19.0 (June 27, 2024). Android release notes refer to Translate from 0.5.0 [7][9][5]. | Both | Equivalent or better. Chrome on Android translates pages and selected text natively [20]. Chrome on iOS not checked. | [7][5] |
| Find in page | In the page menu [16][23]. | iOS (Android not documented) | Equivalent [25]. | [16] |
| Page zoom with percentage | A per-page zoom control (iOS 1.11.0) that shows the percentage and resets to 100% on tap (1.13.0) [7][34]. | iOS | Not checked. | [7] |
| Request desktop site | A toggle in the page menu on iOS 1.11.0. Android 1.4.0 made the setting persist per hostname [7][9]. | Both | Chrome has a desktop site option [unverified]. | [7][9] |
| Force Dark | Android 1.3.1 (December 5, 2024) darkened websites when the system was in dark mode, with an opt-out in Site Settings [9]. | Android | Not checked [unverified]. | [9] |
| Per-site settings | "Site Settings" in the page menu applied overrides for one site [23]. | iOS (Android has Site Settings per release notes) | Equivalent. Chrome has Site settings [35]. | [23][9] |

## Tab model: auto-archive and the Archive

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Auto-archive of inactive tabs | Inactive tabs were closed and moved to an Archive. The default was one day; the options were 12 hours, 1 day, 3 days, 7 days and 30 days [5][6][23]. Present on Android from the beta [8][31]. | Both | Partial. Chrome moves unused tabs to an Inactive Tabs section at the top of the tab switcher. On Android this happens after 14 days or more [36]. On iOS the period is selectable in Settings [37]. The shortest period Chrome offers was not read; Arc's shortest was 12 hours. | [5][6] |
| Archive view | Archived tabs were listed behind an Archive icon in the tab switcher and reopened from there [5][31]. The Archive also served as the app's history [23]. | Both | Partial. Chrome's Inactive Tabs section plus its separate History [36][38]. | [5] |
| Search the Archive | Android 1.10.0 (March 18, 2025) added Archive search in Settings [9]. | Android | Chrome searches history from the address bar on Android [25]. | [9] |
| App-switcher style tab switcher | Tabs were shown as a horizontal stack of cards modelled on the phone's app switcher. Swiping a card up closed it [16][23]. | iOS (Android layout not described in sources) | Different. Chrome uses a tab grid [36]. | [16] |
| Flick between the two most recent pages | The tab button showed thumbnails of the two most recent pages. Flicking up on them switched between the current page and the previous one [16]. | iOS | None found. | [16] |
| Swipe the bottom bar to switch tabs | Android 1.6.0 (January 23, 2025) added left and right swipes on the bottom bar [9]. | Android | Chrome's help describes swiping to a tab in its switcher [36]. Address bar swipe not checked [unverified]. | [9] |
| Swipe to undo a closed tab | Swiping in the opposite direction reopened a tab just closed. iOS 1.17.0 (June 13, 2024) [7]. | iOS | Not checked. | [7] |
| Clear all tabs | After clearing one tab, Android 1.9.0 offered to clear all of them [9]. | Android | Chrome can close all tabs [unverified]. | [9] |
| Incognito | A tab switched to incognito from the search sheet. Its contents were hidden in the tab switcher and it was left out of history [23]. Android had an Incognito mode from the beta [9][39]. | Both | Equivalent [40]. | [23][9] |
| Bookmarks without folders | A page could be bookmarked as a favorite. There were no folders, and favorites could not be renamed [6][16]. | iOS at launch | Chrome is ahead: synced bookmarks, reading list, tab groups and pinned tabs [24][37][36]. | [6][16] |
| Export open tabs | Added for the sunset: Settings then Export Data on iOS, Settings then Storage then Export data on Android, producing a list of open tabs. Browse for Me and Incognito tabs are excluded [15][13]. | Both | Not comparable. | [15] |

## Sync with desktop Arc

All sync ended on November 23, 2026 [13].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Arc Sync in Arc Search | Signing in with an Arc account showed the desktop Sidebar: Spaces, pinned tabs and Today tabs. It reached iOS in April 2024 [3][5] and Android as "an early version" in 1.7.1 (January 30, 2025) [9]. | Both | Equivalent in kind. Chrome syncs bookmarks, reading list, passwords, payment info, settings, history and open tabs through a Google Account [24]. Chrome has no Spaces. | [3][9] |
| Sidebar view | A monitor icon in the tab switcher opened the synced Sidebar. Multiple Spaces were swiped left and right. Reaching it took three taps from the search sheet [3][23]. | iOS (Android layout not described) | Partial. Chrome shows tabs from other devices and synced tab groups [37]. | [3] |
| Pin from the phone to a Space | A page was saved as a pinned tab in a chosen Space or folder through the share sheet, and appeared in the desktop Sidebar with a marker showing it came from Arc Search. The help centre states this was iOS only [3][5]. | iOS | Partial. A Chrome bookmark or tab group change syncs to the desktop [24][37]. | [3][5] |
| End-to-end encryption | Arc Sync encrypted Sidebar data end to end, replacing the earlier iCloud-based sync [41][3]. | Both | Chrome sync encryption was not checked. | [41] |
| Handoff to the Mac | A tab open in Arc Search was offered on the Mac through Apple's Handoff, opening in the Mac's default browser. iOS 1.16.0 [7]. | iOS | Chrome's Handoff support not checked [unverified]. | [7] |
| Sync scope stated by Arc | Arc's sync article lists Spaces, Folders and Tabs for macOS, Windows, iOS and Android [41]. Whether desktop Favorites appeared in Arc Search is not stated in any source read. | Both | Not comparable. | [41] |

## The Arc companion app for iPhone (2023 to 2024)

This app was a Sidebar viewer, not a browser. The first build had no web view and opened Safari [1].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Spaces on the phone | After sign-in, each desktop Space appeared as a page with its colour, pinned tabs and folders [1]. | iOS | None. Chrome has no Spaces. | [1] |
| Recents | A list of the last few tabs opened across Spaces [1]. | iOS | Partial. Chrome shows tabs from other devices [24]. | [1] |
| Ephemeral pages | A page opened from search was discarded on swipe down unless pinned to a Space. There was no new-tab button and no persistent URL bar [1]. | iOS | None found. | [1] |
| Save from other apps | The iOS share sheet sent a link to a Space, where it appeared on the Mac [1][4]. | iOS | Partial. Chrome bookmarks and reading list sync [24]. | [1] |
| View Easels and notes | Easels and notes could be viewed, not created or edited [1][4]. | iOS | None. Chrome has no Easels. | [1] |
| iCloud-based sync | The first version synced through iCloud Drive, which had to be enabled on the Mac [2]. Arc Sync replaced it in 2024 [3]. | iOS | Not comparable. | [2] |
| Stated limits | No access to desktop Favorites, no adding to Today, no renaming, no new Spaces, no extensions or Boosts, no Library [1]. It could not be set as the default browser [6], and App Store reviewers report Google as the only search engine [4]. It required an Arc membership, which was by invitation at launch [1]. | iOS | Not applicable. | [1][6] |

## Gestures and one-handed controls

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Bottom-only controls | All controls sat in a bar at the bottom: tabs, search (plus), and a chevron menu for the current page. The collapsed bar showed no address bar [16]. | Both | Partial. Chrome's address bar can be moved to the bottom on iOS and Android [42][43]. Its menu and tab buttons then sit with it; exact layout not checked. | [16] |
| Collapsing bottom bar | The bar collapsed on scroll down and returned on scroll up. iOS 1.13.0 [7]. Android 1.8.1 fixed the bar covering content pinned to the bottom of a page [9]. | Both | Chrome hides its toolbar on scroll [unverified]. | [7][9] |
| Swipe anywhere to go back | A swipe from anywhere on the page, not only the edge, went back. iOS only, per the help centre [5]. Version 1.11.0 tuned swipes from the middle of the page to reduce accidental triggers [7]. | iOS | None found. Edge swipe is the system convention. | [5][7] |
| Pull to refresh on release | The refresh fired when the drag was released and could be cancelled by dragging back up. iOS 1.16.0 [7]. | iOS | Chrome has pull to refresh [unverified]. | [7] |
| Swipe and hold from the left edge | Opened the tab view, as an alternative to the tab button [6]. | iOS | None found. | [6] |
| Hold the chevron to share | Holding the menu button opened the share sheet directly [16]. | iOS | None found. | [16] |
| Link preview on long press | Long-pressing a link showed a preview of the destination in the menu. iOS 1.16.0 [7]. | iOS | Chrome on Android has "Preview page" on long press, per search-result snippets from Android Central and How-To Geek that I did not open [unverified]. | [7] |
| Long-press link menu | Android 0.3.0 (October 17, 2024) added long press to open a link in a new tab or download an image. A review of the first beta had reported no long-press menu at all [9][31]. | Android | Equivalent in Chrome. | [9] |
| Predictive back | Android 1.2.0 and 1.3.1 added Android's predictive back gesture when leaving the app and on bottom sheets [9]. | Android | Not checked. | [9] |
| Fidget spinner logo | The logo on the empty screen spins when flicked. The App Store listing calls it an easter egg, and Android release notes mention it twice [44][9]. | Both | None. Chrome has an offline dinosaur game, which is a different kind of toy. | [44][9] |

## Ad, tracker and cookie-banner blocking

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Built-in ad and tracker blocking | On by default with no extension: ads, trackers, GDPR popups, banners and newsletter popups [44][6][5]. The App Store copy says "always-on"; a reviewer reports a content blocking toggle in Settings and per-site overrides [23]. | Both | Chrome is behind. Its Android ad blocker removes ads only on sites with poor ad experiences ("Intrusive ads") [35]. Chrome on iOS was not checked. | [44][6] |
| Cookie banner auto-deny | With cookie blocking enabled, the app tried to deny cookie consent prompts and left the prompt alone when it could not do so reliably. iOS 1.38.0 (November 8, 2024) [7]. | iOS (Android blocks banners per launch coverage) | None found. Chrome offers a setting to block third-party cookies [45], which does not dismiss banners. | [7][8] |
| Blocked count | The page menu footer showed the number of ads and trackers blocked on the current page. iOS 1.13.0 [7]. | iOS | None found. | [7] |
| Rebuilt Android blocker | Android 1.3.1 (December 5, 2024) replaced the ad and tracker blocker; Arc states it more than doubled effectiveness in internal tests [9]. A 2026 Play Store review says the blocker has stopped working [46]; I did not test it. | Android | As in the first row. | [9][46] |
| Tracker removal from shared links | Sharing or copying a URL stripped tracking parameters (iOS 1.18.0), with Instagram URLs added in 1.23.0 [7]. | iOS | None found in the sources read. | [7] |

## Privacy and accounts

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| No account needed to browse | Arc Search worked without an Arc account. An account was needed only for sync [31][3][5]. | Both | Chrome also browses signed out. Gemini in Chrome requires sign-in and is unavailable in Incognito [18][19]. | [31][5] |
| Stated data policy | Arc's privacy policy states that the company does not know which sites a user visits, does not see what is typed into the browser, and does not sell data [47]. This is the company's statement; I did not audit it, and Browse for Me queries necessarily left the device. | Both | Not compared here. | [47] |
| Google Play data safety declaration | No data shared with third parties. Collected: crash logs, diagnostics, other app performance data, app interactions, other actions, all for analytics. Encrypted in transit. "Data can't be deleted" on request [48]. | Android | Not compared here. | [48] |
| Clear Browsing Data | In Settings on both platforms [15]. | Both | Equivalent [38]. | [15] |
| Account and data deletion at sunset | Accounts are deactivated on December 22, 2026 and associated personal data deleted within 30 days. Data copy or deletion requests close on December 15, 2026 [13]. | Both | Not applicable. | [13] |
| Certificate bypass and HTTP auth | iOS 1.12.0 added an option to proceed past an invalid HTTPS certificate. iOS 1.19.0 added basic HTTP authentication dialogs [7]. | iOS | Standard in Chrome [unverified]. | [7] |

## System integration: widgets, Shortcuts, default browser

No source read mentions Live Activities or a Siri-specific feature for Arc Search. I record both as not found.

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Home Screen widget (iOS) | Small and medium widgets that opened a new search, the synced Spaces, or Voice Search. iOS 1.11.0 (May 2, 2024) [7][34]. A later description gives search and call as the widget actions [23]. Version 1.25.0 added a "Show Background" option [7]. | iOS | Equivalent. Chrome has Home Screen and Today view widgets [21]. | [7][34] |
| Lock Screen widget (iOS) | Arc Search widgets could be added to the iPhone Lock Screen [49]. | iOS | Equivalent. Chrome has Lock Screen widgets on iPhone [21]. | [49] |
| Home screen widget (Android) | A search widget arrived in Android 0.5.0 (October 31, 2024) [9][49]. The 1.0 release is reported to include several widgets [39]. | Android | Chrome has an Android search widget [unverified]. | [9] |
| Shortcuts action and Action button | Voice Search was exposed as a Shortcuts action, which let iPhone 15 Pro owners assign it to the Action button [34]. A third-party shortcut set built on this covers search, voice search, Browse for Me, dictation and Call Arc [50]. | iOS | Chrome's Shortcuts actions were not checked [unverified]. | [34][50] |
| Spotlight shortcuts | Typing "Arc" in Spotlight showed buttons for a call, a voice search or a typed search [23]. | iOS | Not checked. | [23] |
| Default browser | Arc Search could be set as the default browser on iOS and Android, with a prompt on first launch and a later banner (iOS 1.13.0) [5][7]. | Both | Equivalent. | [5] |
| Open links in native apps | iOS 1.24.0 showed a banner offering to open a page in its installed app in place of opening it automatically. iOS 1.25.0 added an "Open App Links in..." setting with Arc Search or Native App. Android 1.4.0 added App Links support [7][9]. | Both | Not checked. | [7][9] |
| Custom app icons | Alternate icons in Settings, with iOS 18 dark and tinted variants from iOS 1.33.0. Android 1.0.0 added icon choice including an Android-only "Neon" icon [7][9]. | Both | None in Chrome [unverified]. | [7][9] |
| Picture in picture | Video kept playing in a floating window after leaving the app. iOS 1.16.0 [7]. | iOS | Not checked for Chrome mobile [unverified]. | [7] |

## Downloads and files

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Calendar, profile and Wallet files | iOS 1.23.0 handled .ics downloads as new calendar events and installed .mobileconfig files. Versions 1.16.0 and 1.17.0 fixed Apple Wallet pass links, including links with several passes [7]. | iOS | Not checked. | [7] |
| Download naming | iOS 1.16.0 appended sequence numbers to avoid overwriting files [7]. Android 1.12.0 improved filename and file type detection and added long-press download of data URI images [9]. The iOS app could not download files at launch [16]. | Both | Standard in Chrome. | [7][9] |
| File upload | Android 0.3.0 added file uploads to sites [9]. | Android | Standard in Chrome. | [9] |

## Android-specific

Arc Search for Android started narrower than iOS and stayed narrower: it launched without pinch to summarize or Call Arc [8], and pinning to a Space stayed iOS only [5].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Android version support | The beta required Android 13 [39]. Support was extended to Android 12 (0.2.0), Android 11 (1.3.1) and Android 10 (1.5.0, January 15, 2025) [9]. | Android | Not compared. | [9] |
| Landscape orientation | Added in 0.6.0 (November 7, 2024) after a review named its absence [9][31]. | Android | Standard in Chrome. | [9] |
| 120Hz default | 0.6.0 set the refresh rate to 120Hz where the device supports it [9]. | Android | Not checked. | [9] |
| Share sheet options | 0.6.0 added more options to the Share sheet [9]. The release note does not list them. | Android | Not checked. | [9] |
| Third-party search widgets | 1.8.1 accepted more URL formats from third-party search widgets [9]. | Android | Not checked. | [9] |
| Full-screen notice | 1.12.8 (April 1, 2026) shows a notice when the app is reopened onto a page that is in full screen [9]. | Android | Not checked. | [9] |
| Maintenance through 2026 | The last Android release note is 1.12.10 (August 7, 2026): URL-bar spoofing fixes and Android 16 compatibility [9]. Google Play shows an update on October 19, 2026 [46]. | Android | Not applicable. | [9][46] |
| Tablet listing | Google Play lists the app for phone and tablet [46]. | Android | Chrome supports tablets. | [46] |

## iPad and Vision Pro

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| iPad layout | iOS 1.18.0 (June 20, 2024) added an iPad layout. Before that the app ran only as an iPhone app [7][3]. | iOS | Chrome has an iPad app. | [7] |
| visionOS compatibility | The App Store listing shows compatibility with visionOS 1.0 or later [44]. No release note describes visionOS-specific work. | iOS | Not checked. | [44] |
| System requirement | iOS 16.0 or later and iPadOS 16.0 or later [44][5]. | iOS | Not compared. | [44] |

## Accessibility

The App Store listing's accessibility section reads: the developer has not yet indicated which accessibility features this app supports [44].

| Feature | What it did | Platform | Chrome for iOS and Android, late 2026 | Source |
|---|---|---|---|---|
| Text scaling | iOS 1.22.2 (July 18, 2024) made text follow the system's preferred size in onboarding, Settings, Browse for Me results and search queries [7]. | iOS | Not checked. | [7] |
| Voice as input and output | Voice Search on both platforms and, on iOS until its removal, spoken answers through Call Arc [7][9][15]. | Both | Chrome on Android has "Listen to this page", which reads a page aloud with speed and voice controls and offers an AI playback mode [51]. Arc Search has no read-aloud feature in the sources read. | [7][9] |
| Haptic feedback | Haptics on pinch to summarize [29] and on each word recognized by Android voice search [9]. | Both | Not checked. | [29][9] |
| Marketing claim about ADHD | The App Store listing describes blocking, reader mode and the fidget spinner as "great for ADHD" [44]. This is listing copy. I found no evidence behind it. | iOS | Not applicable. | [44] |

## Where Chrome mobile now matches or leads

Chrome closed part of the gap between 2024 and 2026, and Arc's own shutdown closed more of it.

- Page summaries and questions about a page: Gemini in Chrome, on iOS and Android, signed-in users only, rollout incomplete [18][19][30].
- Agentic browsing: auto browse on Android for AI Pro and AI Ultra subscribers in the U.S. It is not available on iPhone or iPad [30][28]. Arc Search had nothing comparable.
- Image search: Google Lens in Chrome [52]. Arc Search had no image search in the sources read.
- Organization: tab groups that sync, pinned tabs, bookmarks, reading list, passwords and payment info [37][36][24]. Arc Search had favorites without folders.
- Bottom address bar on both platforms [42][43].
- Inactive tabs set aside automatically [36][37].

What Chrome mobile still lacks, on the evidence above: content blocking beyond intrusive ads, cookie-banner dismissal, tracker stripping on shared links, a short auto-archive period with a searchable Archive, the flick between two recent pages, back-swipe from anywhere, a keyboard-up launch, and a blocked-item count. None of these depends on Arc's servers, which is why Arc Search for iOS keeps them after December 22 and why they are the items a replacement can still be measured against.


## Not verified

- The companion app's exact names over time rest on two press sources. The App Store history was not read.
- The companion app's deprecation date. Sources give April 2024 for the announcement, not a removal date. Its App Store listing still resolved on 2026-11-26.
- Whether the companion app still functions after November 23, 2026. This is my inference from the end of sync.
- Arc Search iOS versions 1.46 to 1.49. The App Store shows version 1.49.0 dated October 19, but Arc's release notes end at 1.45.0 (October 7, 2025).
- The date Call Arc was removed from iOS. The help centre says only that it "has already been removed".
- Whether pinch to summarize (the gesture) or reader mode ever shipped on Android. Release notes mention only a Summarize button.
- Whether Call Arc ever shipped on Android. No source says it did.
- Whether desktop Favorites were visible in Arc Search.
- Which models Browse for Me used after GPT-4o, and which it used on Android.
- The App Store privacy labels for Arc Search. The capture I read elided that section. The companion app's listing shows Contact Info, User Content, Identifiers, Usage Data and Diagnostics as linked to the user.
- Arc's privacy policy statements. They are quoted, not audited.
- The original arc.net/search marketing page. The URL now redirects to the farewell page and I did not recover an archived copy.
- Live Activities and Siri integration for Arc Search. Not found in any source read.
- Every Chrome cell marked [unverified] or "Not checked": toolbar hide on scroll, pull to refresh, link preview, desktop site, close all tabs, Android search widget, Shortcuts actions, Handoff, custom icons, picture in picture, sync encryption, Chrome iOS ad blocking and translation, and the range of Chrome's inactive-tab periods.
- Chrome extensions on Android. Search-result snippets from third-party sites say Chrome for Android still has none in 2026. I did not open a Google source, so the tables do not rely on it.
- The date of Google's Android bottom-address-bar post. The capture did not include it.
- Gemini in Chrome availability on iOS by region. The help page says only that the rollout is gradual.
- Whether Dia has a mobile app. Arc's help centre lists macOS and Windows only. I did not check Dia's own site.

## Sources

All pages were read on 2026-11-26.

1. The Verge, Arc mobile browser hands-on, March 30, 2023. https://www.theverge.com/2023/3/30/23662130/arc-mobile-browser-hands-on-ios
2. Inverse, Arc Mobile Companion app review, 2023. https://www.inverse.com/tech/arc-mobile-companion-app-design-review-the-browser-company
3. TidBITS, "Arc Search iPhone App Now Syncs Arc Sidebar Tabs", April 29, 2024. https://tidbits.com/2024/04/29/arc-search-iphone-app-now-syncs-arc-sidebar-tabs/
4. App Store, "Sidebar Sync for Arc Members". https://apps.apple.com/us/app/sidebar-sync-for-arc-members/id1669785846
5. Arc Help Center, "Arc for iOS & Android: Arc Search" (pre-sunset edition, Wayback Machine capture of 2026-03-12; the live URL now returns 404). https://web.archive.org/web/20260312101249/https://resources.arc.net/hc/en-us/articles/20887042551831-Arc-for-iOS-Android-Arc-Search
6. TechCrunch, "Arc's new iPhone browser wants to be your search companion", January 28, 2024. https://techcrunch.com/2024/01/28/arcs-new-iphone-browser-wants-to-be-your-search-companion/
7. Arc Help Center, "Arc Search for iOS Release Notes". https://resources.arc.net/hc/en-us/articles/23528454620311-Arc-Search-for-iOS-Release-Notes
8. TechCrunch, "The Browser Company launches Arc Search on Android", October 4, 2024. https://techcrunch.com/2024/10/04/the-browser-company-launches-arc-search-on-android/
9. Arc Help Center, "Arc Search for Android Release Notes". https://resources.arc.net/hc/en-us/articles/27306904379031-Arc-Search-for-Android-Release-Notes
10. TechCrunch, "Mobile browser Arc Search is now generally available on Android", November 14, 2024. https://techcrunch.com/2024/11/14/the-browser-company-makes-arc-search-for-android-generally-available-as-it-thinks-about-other-products/
11. The Browser Company, "Letter to Arc members 2025", May 26, 2025. https://browsercompany.substack.com/p/letter-to-arc-members-2025
12. Business Wire, "Atlassian Completes Acquisition of The Browser Company of New York", October 21, 2025. https://www.businesswire.com/news/home/20251021473486/en/Atlassian-Completes-Acquisition-of-The-Browser-Company-of-New-York
13. Arc Help Center, "Arc Sunset: Key Dates and What to Expect". https://resources.arc.net/hc/en-us/articles/44412972248471
14. TechCrunch, "Arc browser sunsets December 22 as The Browser Company doubles down on Dia", October 22, 2026. https://techcrunch.com/2026/10/22/arc-browser-sunsets-december-22-as-the-browser-company-doubles-down-on-dia/
15. Arc Help Center, "Arc for iOS & Android: Arc Search" (live article, sunset edition). https://resources.arc.net/hc/en-us/articles/25482329571479-Arc-for-iOS-Android-Arc-Search
16. MacStories, "Arc Search Review: My New Default iPhone Browser". https://www.macstories.net/reviews/arc-search-for-iphone/
17. Google Chrome Help, "Use AI Mode in Chrome" (Android). https://support.google.com/chrome/answer/16704170?hl=en&co=GENIE.Platform=Android
18. Google Chrome Help, "Use Gemini in Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/16283624?hl=en&co=GENIE.Platform=iOS
19. Google Chrome Help, "Use Gemini in Chrome" (Android). https://support.google.com/chrome/answer/16283624?hl=en&co=GENIE.Platform=Android
20. Google Chrome Help, "Translate pages and change Chrome languages" (Android). https://support.google.com/chrome/answer/173424?hl=en&co=GENIE.Platform=Android
21. Google Chrome Help, "Create a shortcut for Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/6204307?hl=en&co=GENIE.Platform=iOS
22. Google Chrome Help, "Set default search engine and site search shortcuts" (Android). https://support.google.com/chrome/answer/95426?hl=en&co=GENIE.Platform=Android
23. TapSmart, "Deep dive: find things faster online with Arc Search", 2025. https://www.tapsmart.com/apps/deep-dive-arc-search/
24. Google Chrome Help, "Get your bookmarks, passwords, and more on all your devices" (Android). https://support.google.com/chrome/answer/165139?hl=en&co=GENIE.Platform=Android
25. Google Chrome Help, "Search the web in Chrome" (Android). https://support.google.com/chrome/answer/95440?hl=en&co=GENIE.Platform=Android
26. Google Chrome Help, "Search the web in Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/95440?hl=en&co=GENIE.Platform=iOS
27. TechCrunch, Call Arc coverage, May 23, 2024. https://techcrunch.com/2024/05/23/arc-searchs-new-call-arc-feature-lets-you-ask-questions-by-making-a-phone-call/
28. Google Chrome Help, "Ask Gemini in Chrome to complete tasks for you with auto browse" (Android). https://support.google.com/chrome/answer/16821166?hl=en&co=GENIE.Platform=Android
29. TechCrunch, pinch-to-summarize coverage, February 23, 2024. https://techcrunch.com/2024/02/23/arc-browsers-new-ai-powered-pinch-to-summarize-feature-is-clever-but-often-miss-the-mark/
30. Google, "Tap into the power of Gemini in Chrome on Android", August 18, 2026. https://blog.google/products-and-platforms/products/chrome/gemini-in-chrome-android-auto-browse/
31. Android Authority, "Arc Search for Android shows promise, but it's not a Chrome replacement", October 2024. https://www.androidauthority.com/arc-search-browser-3488152
32. Google Chrome Help, "Use reading mode in Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/14218344?hl=en&co=GENIE.Platform=iOS
33. Google Chrome Help, "Use reading mode in Chrome" (Android). https://support.google.com/chrome/answer/14218344?hl=en&co=GENIE.Platform=Android
34. 9to5Mac, "Arc Search brings new widgets, Action button-capable voice search, and more tab controls", May 2, 2024. https://9to5mac.com/2024/05/02/arc-search-adds-widgets-voice-search/
35. Google Chrome Help, "Visit a site by turning off Chrome's ad blocker" (Android). https://support.google.com/chrome/answer/7632919?hl=en&co=GENIE.Platform=Android
36. Google Chrome Help, "Manage tabs in Chrome" (Android). https://support.google.com/chrome/answer/2391819?hl=en&co=GENIE.Platform=Android
37. Google Chrome Help, "Manage tabs in Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/2391819?hl=en&co=GENIE.Platform=iOS
38. Google Chrome Help, "Delete browsing data in Chrome" (iPhone & iPad). https://support.google.com/chrome/answer/2392709?hl=en&co=GENIE.Platform=iOS
39. 9to5Google, "Arc Search for Android leaves beta, adds Voice Search, widgets, and more", November 14, 2024. https://9to5google.com/2024/11/14/arc-search-for-android-leaves-beta-adds-voice-search-widgets-and-more/
40. Google Chrome Help, "Browse in Incognito mode" (iPhone & iPad). https://support.google.com/chrome/answer/95464?hl=en&co=GENIE.Platform=iOS
41. Arc Help Center, "Arc Sync". https://resources.arc.net/hc/en-us/articles/20272860828823-Arc-Sync
42. Google Chrome Help, "Change the address bar's position" (iPhone & iPad). https://support.google.com/chrome/answer/14181646?hl=en&co=GENIE.Platform=iOS
43. Google, "You can now move your Chrome address bar to the bottom of your Android screen". https://blog.google/products-and-platforms/products/chrome/address-bar-position-change/
44. App Store, "Arc Search: Find it, Faster". https://apps.apple.com/us/app/arc-search-find-it-faster/id6472513080
45. Google Chrome Help, "Delete, allow, and manage cookies in Chrome" (Android). https://support.google.com/chrome/answer/95647?hl=en&co=GENIE.Platform=Android
46. Google Play, "Arc Search: Find it, Faster". https://play.google.com/store/apps/details?id=company.thebrowser.arc
47. arc.net, Privacy Policy, effective October 15, 2025. https://arc.net/privacy
48. Google Play, Arc Search data safety. https://play.google.com/store/apps/datasafety?id=company.thebrowser.arc&hl=en_US
49. Arc Help Center, "How To Set up an Arc Search Widget" (Wayback Machine capture of 2025-07-20; the live URL now returns 404). https://web.archive.org/web/20250720124734/https://resources.arc.net/hc/en-us/articles/25483629594135-How-To-Set-up-an-Arc-Search-Widget
50. Matthew Cassinelli, "New in the Shortcuts Library: Arc Search shortcuts", May 23, 2024. https://matthewcassinelli.com/new-in-the-shortcuts-library-arc-search-shortcuts/
51. Google Chrome Help, "Use Listen to this page mode in Chrome". https://support.google.com/chrome/answer/14768725?hl=en
52. Google Chrome Help, "Search with Google Lens in Chrome" (Android). https://support.google.com/chrome/answer/15086890?hl=en&co=GENIE.Platform=Android
