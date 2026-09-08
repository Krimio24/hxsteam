<p align="center">
  <img src="https://raw.githubusercontent.com/ValveSoftware/source-sdk-2013/master/sp/src/game/client/steam_icon.png" width="90" alt="Steam Logo" />
</p>

<h1 align="center">hxsteam</h1>

<p align="center">
  <b>Lightweight, modern native Steamworks SDK integration for Haxe, Lime, OpenFL, and HaxeFlixel.</b>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/target-C%2B%2B%20%2F%20Desktop-blue.svg" alt="Target C++" />
  <img src="https://img.shields.io/badge/license-MIT-green.svg" alt="License MIT" />
  <img src="https://img.shields.io/badge/haxe-4.x-orange.svg" alt="Haxe 4" />
</p>

---

## ⚡ Features

- **Lifecycle Management**: Safe initialization with AppID, DRM/launch relaunching (`restartAppIfNecessary`), automatic environment variables, and clean shutdown.
- **Auto-Update with Lime/Flixel**: Dispatches callbacks in real-time every frame automatically without requiring boilerplate update hooks.
- **Achievements & Stats (`steam.UserStats`)**:
  - Unlock and clear achievements with immediate in-game Steam Overlay toast popup notifications.
  - Integer and float statistics (`int` / `float`).
  - Achievement progress tracking notifications (`indicateAchievementProgress`).
  - Total or partial stats and achievements reset (`resetAllStats`).
- **Friends & Overlay (`steam.Friends`)**:
  - Retrieve persona name, online state, and friend list counts.
  - Open any Steam Overlay dialog (Achievements, Friends, Community, Settings, etc.).
  - Open web pages or the Steam Store directly in the Overlay browser.
  - **Rich Presence** integration (dynamic status displayed on friends' lists).
- **Steam Cloud / Remote Storage (`steam.RemoteStorage`)**:
  - Read, write, delete, and check files synchronized with the Steam Cloud.
  - Query Cloud enablement status per account and per application.
- **App & DLC Information (`steam.Apps`)**:
  - Check installed DLCs, active/available game languages, beta branches, and VAC ban status.
- **System Utilities (`steam.Utils`)**:
  - Active session duration, country/IP location, Big Picture mode, VR mode, and floating gamepad text input.
- **User Identity (`steam.User`)**:
  - Retrieve 64-bit SteamID (`uint64` formatted as String), player Steam level, and badge levels.

---

## 📦 Installation

Add the library to your `Project.xml` (for Lime / OpenFL / HaxeFlixel projects):

```xml
<haxelib name="hxsteam" />
