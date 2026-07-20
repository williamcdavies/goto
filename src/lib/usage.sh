PROG_USAGE="usage: goto [-h | --help] [-v | --version] <command>"
BIND_USAGE="usage: goto bind <key> <pathspec>"

prog_usage() {
    echo ${PROG_USAGE}
}

bind_usage() {
    echo ${BIND_USAGE}
}