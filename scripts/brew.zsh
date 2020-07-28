#!/usr/bin/env zsh
#
# Brew and brew cask setup.
source ./scripts/_utils.zsh

# Nowadays brew cask is installed by default when you install brew.
# This will be installed as part of Xcode - but brew needs this.
if ! [ -x "$(command -v xcode-select)" ]; then
  echo
  echo "installing xcode-select tools..."
  xcode-select --install
fi
echo "xcode tools are installed: $(xcode-select -v)"

# Only install brew if not already installed previously.
if ! [ -x "$(command -v brew)" ]; then
  echo "installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo
fi

# Just install a normal Brew
function install() {
  brew install "$1"
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    print_success "Installed: $1"
  else
    print_error "Failed to install: $1"
  fi
}

# Install a brew cask
function install_cask() {
  brew cask install "$1"
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    print_success "Installed: $1"
  else
    print_error "Failed to install: $1"
  fi
}

echo "brew is installed: $(brew -v)"
echo "brew updating..."
brew update
brew tap homebrew/cask-drivers

# Homebrew packages (non-cask)
echo
print_info "Installing Homebrew packages..."
brew update
brew cleanup
install mas
install git
install ack
install httpie
install pyenv
install pipenv
install cookiecutter
install php
install composer
install ruby
install htop
install graphviz
install wget
install asciinema
install ssh-copy-id
install golang
install tree
install cloc
install zsh-completions
install zsh-syntax-highlighting
install docker-completion
install vim
install grep
install packer
install terraform
install vault
install terraform-inventory
install terraform-provisioner-ansible
install awscli
install nmap

# Clean up and confirm packages installed
brew cleanup
echo
echo -e "${GREEN_TICK} These Homebrew packages successfully installed:${CYAN}"
brew leaves
echo -e "${NC}"
ask_for_confirmation "Do these all match expected?"

# Homebrew packages (cask only)
echo
print_info "Installing Homebrew Cask packages..."
install_cask java
install_cask google-chrome
install_cask iterm2
install_cask sequel-pro
install_cask transmit
install_cask postman
install_cask sourcetree
install_cask github
install_cask balenaetcher
install_cask calibre
install_cask ccleaner
install_cask cinebench
install_cask spotify
install_cask sublime-text
install_cask jetbrains-toolbox
install_cask vlc
install_cask yed
install_cask sketch
install_cask openemu
install_cask dolphin
install_cask jet
install_cask wireshark
install_cask parallels
install_cask logitech-options
install_cask blender
install_cask unity-hub
install_cask adobe-creative-cloud
install_cask elgato-stream-deck

# Virtualbox requires special permissions
install_cask virtualbox
install_cask virtualbox-extension-pack
install_cask vagrant
install_cask vagrant-manager
install_cask docker

echo
echo -e "${GREEN_TICK} These Homebrew Cask packages successfully installed:${CYAN}"
brew cask list -1
echo -e "${NC}"

# Check casks look to be correct?
ask_for_confirmation "Do these all match expected?"
echo

# This requires a specific order (one cask and one normal brew)
echo
print_info "Installing osxfuse and sshfs..."
install_cask osxfuse
install sshfs
echo
