#!/usr/bin/env zsh
#
# Install Python 3 using uv.
# Ansible and ansible-lint are installed via Homebrew in scripts/dev/brew.zsh.
#
source ./scripts/utility/_utils.zsh

# Install uv / update
curl -LsSf https://astral.sh/uv/install.sh | sh

# Restart shell to ensure uv is in path
source $HOME/.local/bin/env

# Install the latest version of Python
uv self update
uv python install
uv python install 3 --default --preview

# Confirm installed python version and path (which should be ref to uv .local/bin/python)
python --version
which python

# Check that Python 3 now is installed correctly before proceeding.
if ! [ "$(python -V 2>&1)" ]; then
  print_error_exit "Currently installed python version: $(python -V)"
fi

echo -e "${GREEN_TICK} Python successfully installed.${NC}"
