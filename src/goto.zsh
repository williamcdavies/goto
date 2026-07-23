#!/usr/bin/env zsh
. "${0:A:h}/lib/usage.zsh"
. "${0:A:h}/lib/vars.zsh"
. "${0:A:h}/lib/version.zsh"
. "${0:A:h}/lib/bind.zsh"
. "${0:A:h}/lib/help.zsh"
. "${0:A:h}/lib/parse.zsh"
. "${0:A:h}/lib/unbind.zsh"

if [[ ${#} -eq 0 ]]; then
    __goto_help

    return "${GOTO_RETURN_SUCCESS}"
fi

GOTO_CONFIG_FILE="${HOME}/.goto"
touch "${GOTO_CONFIG_FILE}"

# parse `goto` arguments into `GOTO_PRINT_HELP`, `GOTO_PRINT_VERSION`,
# `GOTO_COMMAND`, `GOTO_COMMAND_OPTS`, and `GOTO_COMMAND_ARGS`
__goto_parse "${@}" || return

if [[ "${GOTO_PRINT_HELP}" = TRUE ]]; then
    __goto_help
    
    return "${GOTO_RETURN_SUCCESS}"
fi

if [[ "${GOTO_PRINT_VERSION}" = TRUE ]]; then
    __goto_version

    return "${GOTO_RETURN_SUCCESS}"
fi

case "${GOTO_COMMAND}" in
    bind)
        __goto_bind || return
        ;;
    unbind)
        __goto_unbind || return
        ;;
    *)
        local __key="${GOTO_COMMAND}"

        if ! grep --fixed-string --quiet "${__key}:" "${GOTO_CONFIG_FILE}"; then
            echo "error: not a valid key: ${__key}"
        else
            local __sel="$(grep --fixed-string "${__key}:" "${GOTO_CONFIG_FILE}" | head -n 1)"
            local __dir="${__sel#*:}"

            cd "${__dir}"
        fi
        ;;
esac

return "${GOTO_RETURN_SUCCESS}"