#!/usr/bin/env bash
# NVM / Node (requires .bash_profile)
source ~/.bash_profile
if [ -f "~/.nvm/nvm.sh" ]; then
    source ~/.nvm/nvm.sh
fi

if ! [ "$(command -v nvm)" ]; then
  echo "installing nvm..."
  source ~/.nvm/nvm.sh
  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh | bash
fi
echo "nvm is installed: $(nvm --version)"

if ! [ "$(command -v node)" ]; then
  echo "installing node..."
  source ~/.nvm/nvm.sh
  nvm install node --latest-npm
fi
echo -e "${GREEN_TICK} node is installed: $(node --version) with npm: $(npm --version)${NC}"
