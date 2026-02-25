#!/usr/bin/env zsh
#
# AI tools
#
# Normally only need to run this once.
###########################################
source ./scripts/utility/_utils.zsh
source ./scripts/utility/_brew.zsh

echo "This script will install AI tools"
echo "Press any key to continue... "
read -k 1 -s

# Claude - code and desktop app
print_info "Installing Claude code..."
curl -fsSL https://claude.ai/install.sh | bash
claude --version
claude login
install_cask claude

# OpenAI - codex and desktop app
print_info "Installing OpenAI..."
install codex
codex --version
codex login
install_cask chatgpt

# Cursor
print_info "Installing Cursor..."
install_cask cursor
