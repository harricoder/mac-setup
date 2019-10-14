# Additional python things
echo "installing python bits..."
pip2 install --upgrade setuptools
pip2 install --upgrade pip
pip2 install --upgrade virtualenv

pip3 install --upgrade setuptools
pip3 install --upgrade pip
pip3 install --upgrade virtualenv
pip3 install ipython

# Install Ansible (just for python 3)
if ! [ "$(command -v ansible)" ]; then
  echo "installing ansible..."
  pip3 install ansible paramiko
fi
echo "ansible is installed: $(ansible --version | head -n 1)"

# Other Golang bits to install
if ! [ "$(grep GOPATH ~/.bash_profile)" ]; then
  echo "updating bash for golang..."
  if ! [ -d "~/Projects/Go" ]; then
      mkdir -p ~/Projects/Go
  fi

  echo 'export GOPATH="$HOME/Projects/Go"' >> ~/.bash_profile

  source ~/.bash_profile
fi
go get golang.org/x/tools/cmd/godoc