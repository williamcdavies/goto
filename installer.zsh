#!/usr/bin/env zsh

TARGET_BIN_DIR="/usr/local/bin"
TARGET_LIB_DIR="/usr/local/lib"
TARGET_RC_FILE="${HOME}/.zshrc"

mkdir -p "${TARGET_LIB_DIR}/goto"
touch    "${TARGET_RC_FILE}"

cp       src/bin/goto "${TARGET_BIN_DIR}/goto"
chmod    u+x          "${TARGET_BIN_DIR}/goto"

cp       src/goto.zsh "${TARGET_LIB_DIR}/goto/goto.zsh"
chmod    u+x          "${TARGET_LIB_DIR}/goto/goto.zsh"
cp    -r src/lib      "${TARGET_LIB_DIR}/goto"


MARKER_A="# >>> goto >>>"
MARKER_B="# <<< goto <<<"

if ! grep --fixed-string --quiet "${MARKER_A}" "${TARGET_RC_FILE}"; then
    cat >> "${TARGET_RC_FILE}" <<EOF
${MARKER_A}
goto() { . ${TARGET_LIB_DIR}/goto/goto.zsh "\$@"; }
${MARKER_B}
EOF
else
    sed -i '' "/${MARKER_A}/,/${MARKER_B}/d" "${TARGET_RC_FILE}"

    cat >> "${TARGET_RC_FILE}" <<EOF
${MARKER_A}
goto() { . ${TARGET_LIB_DIR}/goto/goto.zsh "\$@"; }
${MARKER_B}
EOF
fi