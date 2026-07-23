#!/usr/bin/env zsh

__goto_bind() {
    local __key="${GOTO_COMMAND_ARGS[1]}"
    local __dir="${GOTO_COMMAND_ARGS[2]}"

    if [[ -z "${__key}" ]]; then
        echo "error: bind: argument key: got empty string"
        
        return "${GOTO_RETURN_FAILURE}"
    fi

    if [[ -z "${__dir}" ]]; then
        echo "error: bind: argument dir: got empty string"
        
        return "${GOTO_RETURN_FAILURE}"
    fi

    if [[ ! -e "${__dir}" ]]; then
        echo "error: bind: argument dir: no such file or directory: '${__dir}'"
        
        return "${GOTO_RETURN_FAILURE}"
    fi

    if [[ ! -d "${__dir}" ]]; then
        echo "error: bind: argument dir: not a directory: '${__dir}'"
        
        return "${GOTO_RETURN_FAILURE}"
    fi

    if ! grep --fixed-string --quiet "${__key}:" "${GOTO_CONFIG_FILE}"; then
        cat >> "${GOTO_CONFIG_FILE}" <<EOF
${__key}:${__dir}
EOF
    else
        sed -i '' "/^${__key}:/d" "${GOTO_CONFIG_FILE}"

        cat >> "${GOTO_CONFIG_FILE}" <<EOF
${__key}:${__dir}
EOF
    fi
}