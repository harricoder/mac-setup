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

install git
install mas
install wget
install archey

# Clean up and confirm packages installed
clean_brew
show_installed_packages
ask_for_confirmation "Do these all match expected?"

# Homebrew packages (cask only)
echo
print_info "Installing Homebrew Cask packages..."

install_cask ccleaner
install_cask cinebench
install_cask elgato-stream-deck
install_cask google-chrome
install_cask iterm2
install_cask logitech-options
install_cask spotify
install_cask vlc
install_cask visual-studio-code
install_cask docker
install_cask roland-quad-capture-usb-driver

# Check casks look to be correct?
clean_brew
show_installed_cask_packages
ask_for_confirmation "Do these all match expected?"
echo
