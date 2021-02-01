#!/usr/bin/env zsh
#
# NVM / Node (requires .zshrc)
source ~/.zshrc

wanted_nvm_version="0.37.2"

if [ -f "~/.nvm/nvm.sh" ]; then
    source ~/.nvm/nvm.sh
fi

if ! [ "$(command -v nvm)" ] || [ "$(nvm --version 2>&1)" != "$wanted_nvm_version" ]; then
  if ! [ "$(command -v nvm)" ]; then
    echo "installing nvm..."
  else
    echo "updating nvm..."
  fi

  wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v${wanted_nvm_version}/install.sh | bash
  source ~/.nvm/nvm.sh
fi

echo "nvm is installed: $(nvm --version)"

if ! [ "$(command -v node)" ]; then
  echo "installing node..."
  source ~/.nvm/nvm.sh
  nvm install node --latest-npm
fi

echo -e "${GREEN_TICK} node successfully installed: $(node --version) with npm: $(npm --version)${NC}"
