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
install fzf
install git
install gnupg
install golang
install grep
install hashicorp/tap/packer
install hashicorp/tap/terraform
install hashicorp/tap/vault
install htop
install httpie
install java
install jq
install mas
install ncurses
install openssl
install php
install rust
install telnet
install tldr
install tree
install vim
install watch
install wget
install zsh-completions
install zsh-syntax-highlighting

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
install_cask elgato-stream-deck
install_cask github
install_cask google-chrome
install_cask iterm2
install_cask jetbrains-toolbox
install_cask logi-options+
install_cask mockuuups-studio
install_cask notion
install_cask parallels
install_cask pixel-picker
install_cask postman
install_cask sourcetree
install_cask spotify
install_cask suspicious-package
install_cask transmit
install_cask visual-studio-code
install_cask vlc

# Music
install_cask guitar-pro
install_cask ik-product-manager
install_cask ilok-license-manager
install_cask native-access
install_cask presonus-universal-control
install_cask spitfire-audio
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
