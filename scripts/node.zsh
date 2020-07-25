#!/usr/bin/env zsh
#
# NVM / Node (requires .zshrc)
source ~/.zshrc
if [ -f "~/.nvm/nvm.sh" ]; then
    source ~/.nvm/nvm.sh
fi

if ! [ "$(command -v nvm)" ]; then
  echo "installing nvm..."
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
  source ~/.nvm/nvm.sh
fi
echo "nvm is installed: $(nvm --version)"

if ! [ "$(command -v node)" ]; then
  echo "installing node..."
  source ~/.nvm/nvm.sh
  nvm install node --latest-npm
fi
echo -e "${GREEN_TICK} node successfully installed: $(node --version) with npm: $(npm --version)${NC}"
