# mac-screenshot

A tiny macOS screenshot helper that gives me the workflow I wanted from Windows:

```text
Control + Shift + S
        ↓
drag a box
        ↓
save PNG + copy PNG
```

The capture is saved to:

```text
~/Documents/Screenshots
```

and the same image is immediately placed on the clipboard.

No Homebrew packages. No screenshot application. No extra UI.

## What it does

Press **Control + Shift + S** and macOS opens its normal interactive screenshot crosshair.

Drag a rectangle and release.

The screenshot is:

1. saved as a PNG
2. copied to the clipboard as image data

The default filename is sortable:

```text
screenshot-2026-08-24_08-45-32.png
```

If two captures happen within the same second, the next file gets a suffix rather than overwriting the first:

```text
screenshot-2026-08-24_08-45-32-2.png
```

Pressing **Escape** cancels the capture without creating a file.

## Why Control + Shift + S?

I originally wanted **Option + Shift + S** because the physical key placement is close to Windows' `Win + Shift + S`.

That combination worked in most applications, but Finder consumed it for its own keyboard navigation instead of consistently passing it to the Shortcut.

**Control + Shift + S** worked reliably system-wide, including Finder, so it became the default.

The normal macOS screenshot shortcuts remain untouched.

## Requirements

- macOS
- Shortcuts.app
- built-in `screencapture`
- built-in `osascript`

There are no third-party dependencies.

## Install

Quick Install:

```sh
git clone https://github.com/zacharysamuelt/mac-shots.git
cd mac-shots
sh install.sh
```

Clone or download the repository and run:

```sh
chmod +x install.sh
./install.sh
```

The installer copies the command to:

```text
~/.local/bin/mac-screenshot
```

and creates:

```text
~/Documents/Screenshots
```

## Create the keyboard shortcut

Open **Shortcuts** and create a shortcut named:

```text
Mac Screenshot
```

Add the **Run Shell Script** action and use:

```sh
"$HOME/.local/bin/mac-screenshot"
```

Open the shortcut's **Details**, choose **Add Keyboard Shortcut**, and press:

```text
Control + Shift + S
```

That is the only Shortcuts configuration required.

For a more detailed walkthrough, see [`docs/shortcut-setup.md`](docs/shortcut-setup.md).

## Behavior

The shortcut starts directly in macOS's native rectangular selection mode.

- Click and drag to select an area.
- Release to capture.
- Press Escape to cancel.
- Press Space while selecting to use macOS's native window-selection behavior.
- Successful captures are saved as PNG.
- The actual PNG image is copied to the clipboard.
- Cancellation is silent.
- Successful captures do not generate notifications.
- If the file saves but the clipboard step fails, the script shows an error notification.

## Filename format

```text
screenshot-YYYY-MM-DD_HH-MM-SS.png
```

The timestamp uses 24-hour time, which keeps ordinary filename sorting chronological.

## Configuration

The defaults can be changed with environment variables.

Change the destination:

```sh
MAC_SCREENSHOT_DIR="$HOME/Pictures/Screenshots" "$HOME/.local/bin/mac-screenshot"
```

Change the filename prefix:

```sh
MAC_SCREENSHOT_PREFIX="capture" "$HOME/.local/bin/mac-screenshot"
```

For normal use through Shortcuts, no configuration is needed.

## Permissions

The first run may cause macOS to request access.

Screen-capture permissions are managed under:

```text
System Settings
→ Privacy & Security
→ Screen & System Audio Recording
```

Allow **Shortcuts** if macOS asks.

macOS may also ask Shortcuts for access to the Documents folder because the default destination lives under `~/Documents`.

After changing privacy permissions, you may need to quit and reopen Shortcuts.

## iCloud note

If Desktop and Documents synchronization is enabled in iCloud Drive, screenshots saved under `~/Documents/Screenshots` may also be synchronized to iCloud.

That may be useful, but it is worth remembering when capturing sensitive information.

## Manual install

If you do not want to use the installer:

```sh
mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/Documents/Screenshots"
cp mac-screenshot "$HOME/.local/bin/mac-screenshot"
chmod 755 "$HOME/.local/bin/mac-screenshot"
```

Then create the Shortcut using the instructions above.

## Uninstall

Remove the command:

```sh
rm "$HOME/.local/bin/mac-screenshot"
```

Delete the **Mac Screenshot** shortcut separately from Shortcuts.app.

Existing screenshots are left alone.

## Repository layout

```text
mac-screenshot/
├── mac-screenshot
├── install.sh
├── README.md
├── LICENSE
└── docs/
    └── shortcut-setup.md
```

## Design goals

This project is deliberately boring.

It solves one specific annoyance while leaning on functionality macOS already has:

- use the native selection UI
- keep the normal Apple screenshot shortcuts
- save every selected capture
- also put it on the clipboard
- require no third-party software
- stay small enough to understand at a glance
