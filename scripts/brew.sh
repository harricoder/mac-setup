# Nowadays brew cask is installed by default when you install brew.
# Will be installed as part of Xcode - but some packages need this before.
if ! [ -x "$(command -v xcode-select)" ]; then
  echo
  echo "installing xcode-select tools..."
  xcode-select --install
fi
echo "xcode tools are installed: $(xcode-select -v)"

# Only install brew if not already installed previously.
if ! [ -x "$(command -v brew)" ]; then
  echo "installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo
fi

echo "brew is installed: $(brew -v)"
echo "brew updating..."
brew update
brew tap homebrew/cask-drivers

# Homebrew packages (cask only)
echo
echo "Installing Homebrew Cask packages..."
brew cask install java
brew cask install google-chrome
brew cask install iterm2
brew cask install sequel-pro
brew cask install transmit
brew cask install postman
brew cask install sourcetree
brew cask install balenaetcher
brew cask install calibre
brew cask install ccleaner
brew cask install cinebench
brew cask install osxfuse
brew cask install spotify
brew cask install sublime-text
brew cask install jetbrains-toolbox
brew cask install vlc
brew cask install yed
brew cask install sketch
brew cask install openemu
brew cask install dolphin
brew cask install jet
brew cask install wireshark
brew cask install virtualbox
brew cask install virtualbox-extension-pack
brew cask install parallels
brew cask install vagrant
brew cask install vagrant-manager
brew cask install docker
brew cask install logitech-options
brew cask install blender
brew cask install unity-hub
brew cask install adobe-creative-cloud
echo
echo -e "${GREEN_TICK} All Homebrew Cask packages succesfully installed:${CYAN}"
brew cask list -1
echo -e "${NC}"


# Homebrew packages (non-cask)
#   - sshfs needs osxfuse
#   - mas also gets installed (but in the mas.sh script)
echo
echo "Installing Homebrew packages..."
brew install git
brew install ack
brew install httpie
brew install python@2
brew install python
brew install cookiecutter
brew install php
brew install composer
brew install ruby
brew install htop
brew install graphviz
brew install sshuttle
brew install wget
brew install sshfs
brew install golang
brew install tree
brew install zsh
brew install zsh-completions
brew install bash-completion
brew install docker-completion
echo
echo -e "${GREEN_TICK} All Homebrew packages succesfully installed:${CYAN}"
brew leaves
echo -e "${NC}"
echo
