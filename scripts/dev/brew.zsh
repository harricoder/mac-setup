#!/usr/bin/env zsh
#
# Brew and brew cask setup.
source ./scripts/shared/_utils.zsh
source ./scripts/shared/_brew.zsh

# Install and update brew to latest.
install_xcode_tools
install_brew

# Homebrew packages (non-cask)
echo
print_info "Installing Homebrew packages..."
clean_brew

install ack
install aircrack-ng
install asciinema
install awscli
install cloc
install composer
install cookiecutter
install git
install gnupg
install golang
install graphviz
install grep
install htop
install httpie
install jpegoptim
install optipng
install pngquant
install mas
install nmap
install php
install pipenv
install pyenv
install ruby
install ssh-copy-id
install packer
install terraform
install terraform-inventory
install tree
install vault
install vim
install wget
install zsh-completions
install zsh-syntax-highlighting
install tldr
install java
install jq
install watch
install siege

# Clean up and confirm packages installed
clean_brew
show_installed_packages
ask_for_confirmation "Do these all match expected?"

# Homebrew packages (cask only)
echo
print_info "Installing Homebrew Cask packages..."

install_cask adobe-creative-cloud
install_cask aerial
install_cask balenaetcher
install_cask bartender
install_cask blender
install_cask calibre
install_cask cinebench
install_cask dolphin
install_cask drawio
install_cask dropzone
install_cask elgato-stream-deck
install_cask expressvpn
install_cask github
install_cask google-chrome
install_cask imageoptim
install_cask iterm2
install_cask jetbrains-toolbox
install_cask logitech-options
install_cask macs-fan-control
install_cask mockuuups-studio
install_cask openemu
install_cask parallels
install_cask pixel-picker
install_cask postman
install_cask sequel-pro
install_cask canva
install_cask sourcetree
install_cask spotify
install_cask sublime-text
install_cask suspicious-package
install_cask transmit
install_cask unity-hub
install_cask visual-studio-code
install_cask vlc
install_cask wireshark
install_cask warp

# Virtualbox requires special permissions
install_cask virtualbox
install_cask vagrant
install_cask vagrant-manager

# Check casks look to be correct?
clean_brew
show_installed_cask_packages
ask_for_confirmation "Do these all match expected?"
echo

# Install docker, kubectl and minikube in specific order
echo
print_info "Installing docker, kubectl and minikube..."
install_cask docker
install docker-completion
install kubernetes-cli
install minikube
