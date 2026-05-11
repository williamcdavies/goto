#!/bin/bash

TARGET_RC_FILE="$HOME/.zshrc"
TARGET_BIN_DIR="$HOME/.local/bin"

mkdir -p "$TARGET_BIN_DIR"
cp goto.sh "$TARGET_BIN_DIR/goto.sh"
chmod u+x "$TARGET_BIN_DIR/goto.sh"

if ! grep -q "goto()" "$TARGET_RC_FILE"; then
    echo '' >> "$TARGET_RC_FILE"
    echo "goto() { . $TARGET_BIN_DIR/goto.sh \"\$@\"; }" >> "$TARGET_RC_FILE"
fi

echo "Installation complete."