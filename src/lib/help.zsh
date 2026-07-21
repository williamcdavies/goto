#!/usr/bin/env zsh
. "${0:A:h}/usage.zsh"

__goto_help() {
    local __HELP=$(__goto_usage)

    echo "${__HELP}"
}