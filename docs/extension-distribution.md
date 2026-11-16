# Chrome extension installation and updates

For release installs, use a published Chrome Web Store extension with per-user external registration from Monochrome. Chrome still asks the user to enable it, then manages extension updates. Keep a direct store link for installation in individual profiles. While the store package is unavailable, keep the bundled unpacked extension and consider an app-coordinated reload after updates.

These are proposed changes. Installation and update behavior stays as described in [Install](../README.md#install) until an implementation is chosen.

## What Monochrome ships today

- The repository root is the Chrome extension: `manifest.json` declares Manifest V3, `background.js` is its worker, and `options.html` is its options page.
- `project.yml` copies the files in `store/files` into `Monochrome.app/Contents/Resources/extension`. `helper/InstallPanel.swift` offers that folder for Load unpacked in each profile. A source checkout can also be loaded directly.
- `helper/Install.swift` registers the native messaging host on each launch. That registration lets an installed extension talk to the app; it does not install the extension.
- Sparkle updates the app and its bundled extension files. The README requires users to reload the unpacked extension themselves; there is no app-to-extension reload protocol today.
- `store/pack.sh` already produces a store upload, `store/id` records `liabjepobglgnnddhlohohipjjbbdjjo`, and the manifest key gives unpacked copies the same ID. The app registers the IDs from `extension-ids.json`.

## Installation choices

| Approach | First installation | Later updates | Fit for Monochrome |
| --- | --- | --- | --- |
| Web Store link | Open the listing; user adds it in each profile | Chrome downloads published versions | Smallest implementation; useful fallback for the other store flow |
| Web Store with external registration | App writes a per-user JSON file; Chrome offers the extension and asks the user to enable it | Chrome downloads published versions | Recommended for app-assisted installation |
| Bundled unpacked extension | User turns on Developer mode and loads the folder in each profile | Updated files need an extension reload; app coordination could automate that step | Current flow; useful before store publication and for development |
| Enterprise policy | Administrator configures force installation | Managed store or approved self-hosted updates | Optional organizational deployment |

The store options need an approved, published item. An **unlisted** item is sufficient: people can install it using its URL, and it goes through the same review as a public item. Before submission, resolve the reader's single-purpose decision recorded in [the store listing](../store/listing.md#before-submitting). See [store visibility](https://developer.chrome.com/docs/webstore/cws-dashboard-distribution).

For external registration, the app would write:

`~/Library/Application Support/Google/Chrome/External Extensions/liabjepobglgnnddhlohohipjjbbdjjo.json`

```json
{
  "external_update_url": "https://clients2.google.com/service/update2/crx"
}
```

Chrome reads registration at startup and requires confirmation. This is per-user registration, not a silent install or a profile-directory edit. A user who removes the extension blocks subsequent automatic installation. Uninstall handling must remove Monochrome's registration file; Chrome documents this as the external-extension uninstall mechanism. Other supported Chrome variants need their corresponding locations verified. See [external installation](https://developer.chrome.com/docs/extensions/how-to/distribute/install-extensions).

Consumer Chrome on macOS does not accept external installation from a bundled local CRX or an ordinary self-hosted update URL. Packaging the folder as a CRX does not remove the store requirement. See [hosting restrictions](https://developer.chrome.com/docs/extensions/how-to/distribute/host-on-linux).

Enterprise force installation uses `ExtensionInstallForcelist` or `ExtensionSettings`. It prevents users from disabling or removing the extension through Chrome. On macOS, off-store force installation requires MDM, MCX domain management, or Chrome Enterprise Core enrollment. Keep this an administrator deployment option. See [the policy definition](https://chromium.googlesource.com/chromium/src/+/HEAD/components/policy/resources/templates/policy_definitions/Extensions/ExtensionInstallForcelist.yaml).

## Updating alongside the app

**Store distribution:** Sparkle and Chrome are independent update channels. Chrome normally checks at startup and every few hours, and applies a downloaded update when the extension is idle. Store review and browser scheduling mean an app update cannot promise an immediately matching extension version. See [the extension update lifecycle](https://developer.chrome.com/docs/extensions/develop/concepts/extensions-update-lifecycle).

Monochrome's `helper.js` keeps a native messaging connection open. Chrome documents that such connections keep workers alive; combined with the idle requirement, this means Monochrome may delay a downloaded extension update until a reload or browser restart. That is an inference from the current bridge and Chrome's lifecycle rules, and needs a real store-update check. See [worker lifetime](https://developer.chrome.com/docs/extensions/develop/concepts/service-workers/lifecycle#chrome-105).

A future implementation should exchange extension version and bridge compatibility in `hello`. Handle `chrome.runtime.onUpdateAvailable` and arrange a reload once pending work is settled. Use `requestUpdateCheck()` only for a known compatibility need, and handle throttling; it does not fetch files from the app bundle. See [runtime update APIs](https://developer.chrome.com/docs/extensions/reference/api/runtime#method-requestUpdateCheck).

**Bundled unpacked distribution:** After the user loads the extension once, the app could compare its bundled version with the running extension and request `chrome.runtime.reload()` over the bridge. Reload reads the extension's installed folder; it does not move an extension from a source checkout to the app bundle. A stable folder, such as `~/Library/Application Support/Monochrome/extension`, would survive app moves and make the files under app control. Stage a complete replacement before requesting reload, retain a working copy on failure, and reload at most once per version. The first extension version that understands this message still needs a manual reload to activate it. Chrome treats unpacked reloads as updates; see [unpacked behavior](https://developer.chrome.com/docs/extensions/reference/api/runtime#unpacked-extension-behavior).

## Recommended implementation order

1. Publish the store package, initially unlisted if desired. Keep the bundled copy available for development and recovery.
2. Add per-user external registration at normal app launch, with a direct store link for individual profiles. Preserve `--portable` and `--register-host` behavior. Extend uninstall cleanup for the owned registration file.
3. Add version and compatibility reporting per connection. Detect development installs separately before considering any app-directed reload; [`management.getSelf()`](https://developer.chrome.com/docs/extensions/reference/api/management#method-getSelf) exposes installation type without the broad `management` permission. Safari needs its existing separate flow.
4. Add safe activation of downloaded store updates. Keep bridge messages compatible across app and extension release order. Do not overwrite a store-installed extension with bundled files.
5. If store publication will be delayed, implement the stable-folder and reload approach as an interim option. It reduces update steps but retains the first manual load.

The shared ID is necessary for native-host registration, but does not establish a tested migration from unpacked to store installation. Check that transition and preservation of locked URLs, settings, and shortcuts before making it the upgrade path; removing the extension first risks losing its local state.

Before shipping, check fresh and existing profiles, user rejection and removal, Chrome closed during app update, browser restart, app relocation, source installs, both release orders, and a downloaded store update while native messaging is connected. Verify the Chrome variants separately and confirm portable launches leave registration untouched.
