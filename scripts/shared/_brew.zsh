#!/usr/bin/env zsh
#
# Brew and brew cask setup.
# Nowadays brew cask is installed by default when you install brew.
source ./scripts/shared/_utils.zsh

# This will be installed as part of Xcode - but brew needs this.
function install_xcode_tools() {
  if ! [ -x "$(command -v xcode-select)" ]; then
    echo
    echo "installing xcode-select tools..."
    xcode-select --install
  fi
  echo "xcode tools are installed: $(xcode-select -v)"
}

function install_brew() {
  if ! [ -x "$(command -v brew)" ]; then
    echo "installing brew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    # Add the special drivers support.
    brew tap homebrew/cask-drivers
    echo
  fi

  echo "brew is installed: $(brew -v)"
}

function update_brew() {
  echo "brew updating..."
  brew update
}

function clean_brew() {
  brew update
  brew cleanup
}

# Install a normal Brew formulae
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
  brew install --cask "$1"
  RESULT=$?
  if [ $RESULT -eq 0 ]; then
    print_success "Installed: $1"
  else
    print_error "Failed to install: $1"
  fi
}

function show_installed_packages() {
  echo
  echo -e "${GREEN_TICK} These Homebrew packages successfully installed:${CYAN}"
  brew leaves
  echo -e "${NC}"
}

function show_installed_cask_packages() {
  echo
  echo -e "${GREEN_TICK} These Homebrew Cask packages successfully installed:${CYAN}"
  brew list --cask -1
  echo -e "${NC}"
}
