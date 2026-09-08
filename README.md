# hxsteam
**hxsteam** is a lightweight, modern Steamworks integration library for Haxe, Lime, OpenFL, and HaxeFlixel (targeting C++/Desktop).
## Features
- **Steam API Core Lifecycle**: `Steam.init(appId)`, `Steam.update()`, `Steam.stop()`, `Steam.isSteamRunning()`, `Steam.restartAppIfNecessary()`.
- **Achievements & Stats (`steam.UserStats`)**: Set, get, store achievements and integer/float statistics, track achievement progress limits, query achievement counts and descriptions.
- **Friends & Overlay (`steam.Friends`)**: Read player persona name, persona state, friend list counts, Rich Presence, open Steam Overlay dialogs, web pages, and store pages.
- **Apps & DLC (`steam.Apps`)**: Check subscriptions, installed DLCs, game languages, beta branches, VAC status, and installation directories.
- **Utils (`steam.Utils`)**: Query App ID, active session time, Steam server time, IP country, VR mode, Big Picture mode, overlay status.
- **User Information (`steam.User`)**: Get 64-bit Steam ID string, Steam level, badge levels, logon status.
- **Cloud & Remote Storage (`steam.RemoteStorage`)**: File write, file read, file exists, delete, forget, file size, quota, and Cloud enablement.
---
## Installation & Setup
In your project's `Project.xml` (Lime / OpenFL / HaxeFlixel):
```xml
<haxelib name="hxsteam" />
```
*Note: Lime will automatically copy `steam_api64.dll` (or `.so`/`.dylib` on Linux/macOS) into your export binaries folder.*
---
