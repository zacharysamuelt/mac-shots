# Shortcut setup

This guide assumes `mac-screenshot` has already been installed with:

```sh
./install.sh
```

## 1. Create the shortcut

Open the **Shortcuts** application.

Create a new shortcut named:

```text
Mac Screenshot
```

## 2. Add Run Shell Script

Search the action library for:

```text
Run Shell Script
```

Add it to the shortcut.

The shell script action should contain only:

```sh
"$HOME/.local/bin/mac-screenshot"
```

No shortcut input needs to be passed to the command.

## 3. Assign the keyboard shortcut

Open the shortcut's **Details** panel.

Choose:

```text
Add Keyboard Shortcut
```

Press:

```text
Control + Shift + S
```

The shortcut should now be available globally.

## 4. First test

Press **Control + Shift + S**.

The pointer should become the standard macOS screenshot crosshair.

Drag a rectangular selection and release.

The result should appear in:

```text
~/Documents/Screenshots
```

with a filename similar to:

```text
screenshot-2026-08-24_08-45-32.png
```

Immediately press **Command + V** in an application that accepts pasted images.

The same screenshot should paste from the clipboard.

## 5. Permissions

The first run may trigger macOS privacy prompts.

For screen capture, check:

```text
System Settings
→ Privacy & Security
→ Screen & System Audio Recording
```

Allow **Shortcuts** if macOS lists it there.

macOS may separately request access to the Documents folder.

If you change one of these permissions manually, quit and reopen Shortcuts before testing again.

## 6. Test cancellation

Press **Control + Shift + S**, then press **Escape** without selecting anything.

Expected behavior:

- no screenshot file is created
- no notification appears
- the command exits quietly

## Why not Option + Shift + S?

The first version used:

```text
Option + Shift + S
```

The key placement felt closer to Windows' `Win + Shift + S`.

In testing, Finder intercepted that combination for its own keyboard navigation. It worked in other applications but was unreliable whenever Finder was active.

Using:

```text
Control + Shift + S
```

resolved the conflict and worked consistently across applications.

## Existing macOS screenshot shortcuts

This project does not replace Apple's screenshot commands.

```text
Shift + Command + 3            Full screen
Shift + Command + 4            Selected area
Control + Shift + Command + 4  Selected area to clipboard
Shift + Command + 5            Screenshot / recording toolbar
Control + Shift + S            Save + clipboard via mac-screenshot
```
