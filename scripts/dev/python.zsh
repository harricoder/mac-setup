#!/usr/bin/env zsh
#
# Install Python 3 using pyenv
#
# https://opensource.com/article/19/5/python-3-default-mac#what-to-do
source ./scripts/shared/_utils.zsh

wanted_python_version="3.8.7"

python_version="$(python -V 2>&1)"
if [ "$python_version" != "Python $wanted_python_version" ]; then
  echo "installing python 3 via pyenv..."
  pyenv install "$wanted_python_version"

  pyenv global "$wanted_python_version"
  pyenv version

  eval "$(pyenv init -)"
fi

echo "Installed Python version..."
python -V
pip -V

# Check that Python 3 now is installed correctly before proceeding.
if [ "$(python -V 2>&1)" != "Python $wanted_python_version" ]; then
  print_error_exit "Currently installed python version: $python_version does not match wanted $wanted_python_version"
fi

# Update pip and setuptools
pip3 install --upgrade pip setuptools wheel

# Install Ansible (just for python 3)
if ! [ "$(command -v ansible)" ]; then
  echo "installing ansible..."
  pip3 install ansible paramiko
fi
echo "ansible is installed: $(ansible --version | head -n 1)"

echo -e "${GREEN_TICK} Python successfully installed.${NC}"
