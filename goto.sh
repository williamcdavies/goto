#!/bin/bash

RETURN_SUCCESS=0
RETURN_FAILURE=1

CONFIG="$HOME/.goto"
touch "$CONFIG"

# if argv[1] is map
if [[ "$1" = "map" ]]; then
    # set expected argc to 3
    EXPECTED_ARGC=3

    # if argc is less than expected argc
    if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too few arguments"
        echo "usage: goto map <key> <pathspec>"
        return "$RETURN_FAILURE"
    fi

    # if argc is greater than expected argc
    if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too many arguments"
        echo "usage: goto map <key> <pathspec>"
        return "$RETURN_FAILURE"
    fi

    # assign KEY to argv[2]
    KEY="$2"

    # assign VAL to argv[3]
    VAL="$3"

    # delete stale mapping
    sed -i '' "/^${KEY} /d" "$CONFIG" 2>/dev/null

    # append fresh mapping
    echo "${KEY} ${VAL}" >> "$CONFIG"
else
    # set expected argc to 1
    EXPECTED_ARGC=1

    # if argc is less than expected argc
    if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too few arguments"
        echo "usage: goto <key>"
        return "$RETURN_FAILURE"
    fi

    # if argc is greater than expected argc
    if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
        echo "fatal: too many arguments"
        echo "usage: goto <key>"
        return "$RETURN_FAILURE"
    fi

    # assign KEY to argv[2]
    KEY="$1"

    # assign VAL to pathspec
    VAL=$(grep "^${KEY} " "$CONFIG" 2>/dev/null | awk '{print $2}' 2>/dev/null)

    # if VAL is empty
    if [[ -z "$VAL" ]]; then
        echo "fatal: no mapping found for key '${KEY}'"
        return "$RETURN_FAILURE"
    fi

    # cd into VAL
    cd "$VAL" || return "$RETURN_FAILURE"
fi

return "$RETURN_SUCCESS"