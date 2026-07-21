#!/usr/bin/env zsh
. "${0:A:h}/usage.sh"

__goto_help() {
    local __HELP=$(usage)

    echo "${__HELP}"
}