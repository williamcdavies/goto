#!/usr/bin/env zsh

__goto_unbind() {
    local __key="${GOTO_COMMAND_ARGS[1]}"

    if [[ -z "${__key}" ]]; then
        echo "error: unbind: argument key: got empty string"
        
        return "${GOTO_RETURN_FAILURE}"
    fi

    if ! grep --fixed-string --quiet "${__key}:" "${GOTO_CONFIG_FILE}"; then
        echo "error: unbind: not a valid key: ${__key}"
    else
        sed -i '' "/^${__key}:/d" "${GOTO_CONFIG_FILE}"
    fi
}