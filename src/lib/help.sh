#!/usr/bin/env zsh
. "${0:A:h}/usage.sh"

__goto_help() {
    local __HELP=$(__goto_usage)

    echo "${__HELP}"
}