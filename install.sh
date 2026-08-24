#!/bin/sh

set -eu

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
INSTALL_DIR="$HOME/.local/bin"
SCREENSHOT_DIR="$HOME/Documents/Screenshots"
TARGET="$INSTALL_DIR/mac-screenshot"

printf '%s\n' "Installing mac-screenshot..."

mkdir -p "$INSTALL_DIR"
mkdir -p "$SCREENSHOT_DIR"

cp "$SCRIPT_DIR/mac-screenshot" "$TARGET"
chmod 755 "$TARGET"

printf '\n%s\n' "Installed:"
printf '  %s\n' "$TARGET"
printf '\n%s\n' "Screenshot folder:"
printf '  %s\n' "$SCREENSHOT_DIR"

cat <<'EOF'

Next:
  1. Open the Shortcuts app.
  2. Create a shortcut named "Mac Screenshot".
  3. Add the "Run Shell Script" action.
  4. Put this in the action:

       "$HOME/.local/bin/mac-screenshot"

  5. Open the shortcut's Details.
  6. Choose "Add Keyboard Shortcut".
  7. Press Option + Shift + S.

The first run may ask for screen-recording or file-access permission.
EOF
