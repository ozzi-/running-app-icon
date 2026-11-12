# Running App Icon

A **Patchmanager2** patch for Sailfish OS.

Overlays each running app's icon at the bottom-centre of its switcher preview
card on the home screen, so you can tell which app is which at a glance.

## How it works

This is a PM2 (unified-diff) patch. It adds a small icon badge to the shell's
running-app preview card by patching:

    /usr/share/lipstick-jolla-home-qt5/switcher/SwitcherItem.qml

The badge reuses the shell's own `LauncherIcon` and the card's
`launcherItem.iconId`, so it shows each app's real icon. It only appears while
the app's preview is visible.

## Files

- `unified_diff.patch` — the PM2 patch (applied with `patch -p1`).
- `main.png` — the patch icon shown in Patchmanager2.
- `build.sh` — rebuilds the installable `.zip` from the two files above.

## Build

    ./build.sh

Produces `dist/running-app-icon-1.1.0.zip` (flat: `unified_diff.patch` +
`main.png`), which is the archive Patchmanager2 installs.

## Install

Add the built zip to a Patchmanager2 store (the openrepos PM2 store, or a
store URL you point Patchmanager2 at) and install it in the Patchmanager2 app.
After a Sailfish OS update that modifies `SwitcherItem.qml`, re-apply the patch
(normal PM2 behaviour).

## Target

Sailfish OS 5.2.0.22 (Jolla), `lipstick-jolla-home-qt5-1.27.18.2`.

## Author

ozzi-

## License

Provided as-is. This patch modifies `SwitcherItem.qml`, which is part of
Jolla/OEM's `lipstick-jolla-home-qt5` (GPL-2.0).
