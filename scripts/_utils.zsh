#!/usr/bin/env zsh
#
# General constants and utils file
#
# Should be sourced in to script: source ./scripts/_utils.zsh

# Colours
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export WHITE='\033[1;37m'
export NC='\033[0m'

# Green Tick:
export GREEN_TICK="${GREEN}\xE2\x9C\x94${NC}"

# Config folder name for location of profile / pics / etc: i.e. ~/Configs:
export PROFILE_DIR="Configs"

# Utility functions:
ask_for_confirmation() {
  print_question "$1 (y/n)"
  read -k 1 REPLY
  if [[ ! "$REPLY" =~ ^[Yy]$ ]]; then
    print_error_exit "Exited program."
  fi
  echo
}

print_question() {
  echo -e "${YELLOW}  [?] $1 ${NC}"
}

print_success() {
  echo -e "${GREEN}  [✔] $1 ${NC}"
}

print_error() {
  echo -e "${RED}  [✖] $1 ${NC}"
}

print_info() {
  echo -e "${PURPLE}$1${NC}"
}

print_error_exit() {
  print_error $1
  exit 1
}
