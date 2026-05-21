#!/bin/bash

TARGET_RC_FILE="${HOME}/.zshrc"
TARGET_BIN_DIR="/usr/local/bin"
TARGET_SRC_DIR="${TARGET_BIN_DIR}/goto"

mkdir -p "${TARGET_SRC_DIR}"
cp -r src "${TARGET_SRC_DIR}"
chmod u+x "${TARGET_SRC_DIR}/src/goto.sh"

if ! grep -q "goto()" "${TARGET_RC_FILE}"; then
    echo '' >> "${TARGET_RC_FILE}"
    echo "goto() { . ${TARGET_SRC_DIR}/src/goto.sh \"\$@\"; }" >> "${TARGET_RC_FILE}"
fi