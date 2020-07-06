#!/usr/bin/env bash
#
# General constants and utils file
# Should be sourced in to script: source ./utils.sh

# Colours
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[1;37m'
export NC='\033[0m'

# UTF-8:
export GREEN_TICK="${GREEN}\xE2\x9C\x94${NC}"

# Other settings:
export PROFILE_DIR="Configs"

answer_is_yes() {
    [[ "$REPLY" =~ ^[Yy]$ ]] \
        && return 0 \
        || return 1
}

ask_for_confirmation() {
    print_question "$1 (y/n) "
    read -n 1
    printf "\n"
}

print_question() {
    # Print output in yellow
    printf "\e[0;33m  [?] $1\e[0m"
}

print_result() {
    [ $1 -eq 0 ] \
        && print_success "$2" \
        || print_error "$2"

    [ "$3" == "true" ] && [ $1 -ne 0 ] \
        && exit
}

print_success() {
    # Print output in green
    printf "\e[0;32m  [✔] $1\e[0m\n"
}

print_error() {
    # Print output in red
    printf "\e[0;31m  [✖] $1 $2\e[0m\n"
}

print_info() {
    # Print output in purple
    printf "\n\e[0;35m $1\e[0m\n\n"
}
