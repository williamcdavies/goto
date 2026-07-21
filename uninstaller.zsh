#!/usr/bin/env zsh

TARGET_BIN_DIR="/usr/local/bin"
TARGET_LIB_DIR="/usr/local/lib"
TARGET_RC_FILE="${HOME}/.zshrc"

rm -f  "${TARGET_BIN_DIR}/goto"
rm -rf "${TARGET_LIB_DIR}/goto"
rm -f  "${HOME}/.goto"


MARKER_A="# >>> goto >>>"
MARKER_B="# <<< goto <<<"

if [[ -f "${TARGET_RC_FILE}" ]]; then
    sed -i '' "/${MARKER_A}/,/${MARKER_B}/d" "${TARGET_RC_FILE}"
fi