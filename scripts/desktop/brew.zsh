#!/usr/bin/env zsh
#
# Brew and brew cask setup.
source ./scripts/utility/_utils.zsh
source ./scripts/utility/_brew.zsh

# Install and update brew to latest.
install_xcode_tools
install_brew

# Homebrew packages (non-cask)
echo
print_info "Installing Homebrew packages..."
clean_brew

install asciinema
install awscli
install cloc
install composer
install git
install mas
install grep
install htop
install httpie
install ncurses
install gnupg
install golang
install hashicorp/tap/packer
install hashicorp/tap/vault
install hashicorp/tap/terraform
install php
install poetry
install pyenv
install tree
install vim
install zsh-completions
install zsh-syntax-highlighting
install tldr
install fzf
install java
install jq
install watch
install telnet
install openssl
install wget

# Clean up and confirm packages installed
clean_brew
show_installed_packages
ask_for_confirmation "Do these all match expected?"

# Homebrew packages (cask only)
echo
print_info "Installing Homebrew Cask packages..."

# Dev / General
install_cask 1password
install_cask adobe-creative-cloud
install_cask balenaetcher
install_cask blender
install_cask calibre
install_cask chatgpt
install_cask cursor
install_cask drawio
install_cask dropzone
install_cask github
install_cask elgato-stream-deck
install_cask google-chrome
install_cask jetbrains-toolbox
install_cask postman
install_cask logi-options+
install_cask mockuuups-studio
install_cask parallels
install_cask pixel-picker
install_cask sourcetree
install_cask transmit
install_cask spotify
install_cask suspicious-package
install_cask visual-studio-code
install_cask iterm2
install_cask vlc

# Music
install_cask presonus-universal-control
install_cask ilok-license-manager
install_cask synthesia

# Docker
install_cask docker
install docker-completion
install kubernetes-cli
install minikube

# Check casks look to be correct?
clean_brew
show_installed_cask_packages
ask_for_confirmation "Do these all match expected?"
echo
