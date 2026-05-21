#!/bin/bash
. $(dirname "${0}")/lib/usage.sh
. $(dirname "${0}")/lib/version.sh

# assign RETURN_SUCCESS to 0
RETURN_SUCCESS=0
# assign RETURN_FAILURE to 1
RETURN_FAILURE=1

# assign CONFIG to ~/.goto
CONFIG="${HOME}/.goto"
# touch ~/.goto
touch "${CONFIG}"

# assign PROGRAM_FLAGS to []
PROGRAM_FLAGS=()
# assign SUBCOMMAND to empty string
SUBCOMMAND=""
# assign SUBCOMMAND_FLAGS to []
SUBCOMMAND_FLAGS=()
# assign SUBCOMMAND_ARGS to []
SUBCOMMAND_ARGS=()

# assign PARSING_STATE to 0
PARSING_STATE=0
# while argc is greater than 0
while [[ ${#} -gt 0 ]]; do
    case ${PARSING_STATE} in
        # parsing program flags
        0)
            case ${1} in
                -h|--help)
                    print_usage
                    return ${RETURN_SUCCESS}
                    ;;
                -v|--version)
                    print_version
                    return ${RETURN_SUCCESS}
                    ;;
                -*|--*)
                    echo "unkown option: '${1}'"
                    print_usage
                    return ${RETURN_FAILURE}
                    ;;
                *)
                    ((PARSING_STATE+=1))
                    ;;
            esac
            ;;
        # parsing subcommand
        1)
            SUBCOMMAND=${1}
            shift
            ((PARSING_STATE+=1))
            ;;
        # parsing subcommand flags
        2)
            case ${1} in
                -*|--*)
                    echo "unkown option: '${1}'"
                    print_usage
                    return ${RETURN_FAILURE}
                    ;;
                *)
                    ((PARSING_STATE+=1))
                    ;;
            esac
            ;;
        # parsing subcommand args
        3)
            case ${1} in
                *)
                    SUBCOMMAND_ARGS+=("${1}")
                    shift
                    ;;
            esac
            ;;
    esac
done


# # if argv[1] is map
# if [[ "$1" = "map" ]]; then
#     # set expected argc to 3
#     EXPECTED_ARGC=3

#     # if argc is less than expected argc
#     if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
#         echo "fatal: too few arguments"
#         echo "usage: goto map <key> <pathspec>"
#         return "$RETURN_FAILURE"
#     fi

#     # if argc is greater than expected argc
#     if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
#         echo "fatal: too many arguments"
#         echo "usage: goto map <key> <pathspec>"
#         return "$RETURN_FAILURE"
#     fi

#     # assign KEY to argv[2]
#     KEY="$2"

#     # assign VAL to argv[3]
#     VAL="$3"

#     # delete stale mapping
#     sed -i '' "/^${KEY} /d" "$CONFIG" 2>/dev/null

#     # append fresh mapping
#     echo "${KEY} ${VAL}" >> "$CONFIG"
# else
#     # set expected argc to 1
#     EXPECTED_ARGC=1

#     # if argc is less than expected argc
#     if [[ "$#" -lt "$EXPECTED_ARGC" ]]; then
#         echo "fatal: too few arguments"
#         echo "usage: goto <key>"
#         return "$RETURN_FAILURE"
#     fi

#     # if argc is greater than expected argc
#     if [[ "$#" -gt "$EXPECTED_ARGC" ]]; then
#         echo "fatal: too many arguments"
#         echo "usage: goto <key>"
#         return "$RETURN_FAILURE"
#     fi

#     # assign KEY to argv[2]
#     KEY="$1"

#     # assign VAL to pathspec
#     VAL=$(grep "^${KEY} " "$CONFIG" 2>/dev/null | awk '{print $2}' 2>/dev/null)

#     # if VAL is empty
#     if [[ -z "$VAL" ]]; then
#         echo "fatal: no mapping found for key '${KEY}'"
#         return "$RETURN_FAILURE"
#     fi

#     # cd into VAL
#     cd "$VAL" || return "$RETURN_FAILURE"
# fi

return "${RETURN_SUCCESS}"