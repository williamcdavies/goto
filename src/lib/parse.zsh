#!/usr/bin/env zsh
. "${0:A:h}/help.zsh"
. "${0:A:h}/vars.zsh"

__goto_parse() {
    GOTO_PRINT_HELP=FALSE
    GOTO_PRINT_VERSION=FALSE
    GOTO_COMMAND=""
    GOTO_COMMAND_OPTS=()
    GOTO_COMMAND_ARGS=()
    
    local __REMAINING=("${@}")

    __goto_parse_global_opts  "${__REMAINING[@]}" || return
    __goto_parse_command      "${__REMAINING[@]}"
    __goto_parse_command_opts "${__REMAINING[@]}"
    __goto_parse_command_args "${__REMAINING[@]}"
}

__goto_parse_global_opts() {
    while (($#)); do
        case "${1}" in
            -h|--help)
                GOTO_PRINT_HELP=TRUE
                shift
                ;;

            -v|--version)
                GOTO_PRINT_VERSION=TRUE
                shift
                ;;

            --)
                shift

                break
                ;;
            
            -*|--*)
                echo "error: unknown option: '${1}'"
                __goto_help
                
                return "${GOTO_RETURN_FAILURE}"
                ;;
            
            *)
                break
                ;;
        esac
    done

    __REMAINING=("${@}")
}

__goto_parse_command() {
    if (($#)); then
        GOTO_COMMAND="${1}"
        shift
    fi

    __REMAINING=("${@}")
}

__goto_parse_command_opts() {
    while (($#)); do
        case "${1}" in
            --)
                shift

                break
                ;;
            
            -*|--*)
                GOTO_COMMAND_OPTS+=("${1}")
                shift
                ;;
            
            *)
                break
                ;;
        esac
    done

    __REMAINING=("${@}")
}

__goto_parse_command_args() {
    while (($#)); do
        case "${1}" in
            *)
                GOTO_COMMAND_ARGS+=("${1}")
                shift
                ;;
        esac
    done
}