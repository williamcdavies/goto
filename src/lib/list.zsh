#!/usr/bin/env zsh

__goto_list() {
    local __sel="$(cat "${GOTO_CONFIG_FILE}")"

    echo "${__sel}"
}