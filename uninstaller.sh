#!/bin/bash

TARGET_RC_FILE="${HOME}/.zshrc"
TARGET_BIN_DIR="/usr/local/bin"
TARGET_SRC_DIR="${TARGET_BIN_DIR}/goto"

rm -rf "${TARGET_SRC_DIR}"
rm "~/.goto"
sed -i "" "/goto()/d" ~/.zshrc

source ~/.zshrc