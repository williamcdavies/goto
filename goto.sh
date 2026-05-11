#!/bin/bash

RETURN_SUCCESS=0
RETURN_FAILURE=1

CONFIG="$HOME/.goto"
touch "$CONFIG"

if [[ "$1" = "map" ]]; then
    EXPECTED_ARGC=3

    if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too few arguments"
        echo "usage: goto map <key> <pathspec>"
        return "$RETURN_FAILURE"
    fi

    if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too many arguments"
        echo "usage: goto map <key> <pathspec>"
        return "$RETURN_FAILURE"
    fi

    KEY="$2"
    VAL="$3"

    sed -i '' "/^${KEY} /d" "$CONFIG" 2>/dev/null
    echo "${KEY} ${VAL}" >> "$CONFIG"
else
    EXPECTED_ARGC=1

    if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too few arguments"
        echo "usage: goto <key>"
        return "$RETURN_FAILURE"
    fi

    if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too many arguments"
        echo "usage: goto <key>"
        return "$RETURN_FAILURE"
    fi

    KEY="$1"
    PATHSPEC=$(grep "^${KEY} " "$CONFIG" 2>/dev/null | awk '{print $2}' 2>/dev/null)

    if [[ -z "$PATHSPEC" ]]; then
        echo "fatal: no association found for key '${KEY}'"
        return "$RETURN_FAILURE"
    fi

    cd "$PATHSPEC" || return "$RETURN_FAILURE"
fi

return "$RETURN_SUCCESS"