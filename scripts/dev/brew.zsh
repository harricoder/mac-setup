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

install ack
install aircrack-ng
install asciinema
install awscli
install cloc
install composer
install cookiecutter
install fzf
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
install hashicorp/tap/packer
install hashicorp/tap/vault
install hashicorp/tap/terraform
install tree
install vim
install wget
install zsh-completions
install zsh-syntax-highlighting
install tldr
install java
install jq
install watch
install siege
install telnet
install openssl

# Clean up and confirm packages installed
clean_brew
show_installed_packages
ask_for_confirmation "Do these all match expected?"

# Homebrew packages (cask only)
echo
print_info "Installing Homebrew Cask packages..."

install_cask adobe-creative-cloud
install_cask balenaetcher
install_cask blender
install_cask calibre
install_cask cinebench
install_cask drawio
install_cask dropzone
install_cask elgato-stream-deck
install_cask expressvpn
install_cask github
install_cask google-chrome
install_cask firefox
install_cask imageoptim
install_cask iterm2
install_cask jetbrains-toolbox
install_cask logi-options+
install_cask mockuuups-studio
install_cask parallels
install_cask pixel-picker
install_cask postman
install_cask canva
install_cask sourcetree
install_cask spotify
install_cask suspicious-package
install_cask transmit
install_cask unity-hub
install_cask visual-studio-code
install_cask vlc
install_cask wireshark
install_cask 1password

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
