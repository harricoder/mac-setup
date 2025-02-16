#!/usr/bin/env zsh
#
# Git and git configs.
source ./scripts/utility/_utils.zsh

print_info "Setting up Git..."
cp ./dotfiles/.gitignore ~/.gitignore

# Only ask for username if not already added into configs
if ! [ "$(grep 'email =' ~/.gitconfig)" ]; then
  read "name?Enter Your Git display name: "
  git config --global user.name "$name"

  read  "email?Enter Your Git email address: "
  git config --global user.email "$email"
fi

EMAIL=$(git config --global user.email)
print_question "Do you want to create a GPG key for "$EMAIL"? (y/n)"
read -k 1 REPLY
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  echo
  gpg --version
  
  # Make sure not to create a key if it already exists
  if gpg --list-secret-keys "$EMAIL" >/dev/null 2>&1; then
    echo "A GPG key already exists."
  else
    echo "Creating new GPG key (use this email address: $EMAIL)..."
    gpg --full-generate-key

    GPG_KEY_ID=$(gpg --list-secret-keys --keyid-format=long "$EMAIL" 2>/dev/null | awk '/sec/{print $2}' | cut -d'/' -f2 | head -n 1)
    if [ -n "$GPG_KEY_ID" ]; then
      echo "Created GPG key: $GPG_KEY_ID"
      echo "Configuring Git to use this key..."
      git config --global gpg.program $(which gpg)
      git config --global user.signingkey "$GPG_KEY_ID"

      print_question "Do you want to always sign commit messages using this GPG key? (y/n)"
      read -k 1 REPLY
      if [[ "$REPLY" =~ ^[Yy]$ ]]; then
        git config --global commit.gpgsign true
        echo
        echo "Git is now configured to automaticlaly sign commits with GPG key: $GPG_KEY_ID"
      fi
      echo

      gpg --armour --export "$GPG_KEY_ID" | pbcopy
      pbpaste

      echo
      echo "Please copy the above key to add to GitHub"
    else
      print_error "No GPG key found for $EMAIL."
      echo "Run 'gpg --full-generate-key' manually to create a new key."
    fi
  fi
fi
echo

# These can just get set anyways (useful if went out of sync too)
echo " * assigning custom gitignore file"
git config --global core.excludesfile ~/.gitignore

echo " * setting editor to vim"
git config --global core.editor "vim"

echo " * setting pull strategy to fast-forward only"
git config --global pull.ff only

echo " * setting default branch name to main"
git config --global init.defaultBranch main

echo " * creating aliases"
# Simple log (latest 25 hash and msg only)
git config --global alias.slog 'log --all --decorate --oneline --graph -n 25'
# View contributor list (i.e. shortlog)
git config --global alias.brag 'shortlog -s -n --all'
# Fully reset current branch back to remote (good for master and feature if being tracked)
git config --global alias.reset-branch 'reset --hard @{u}'
# Quick aliases
git config --global alias.co checkout
git config --global alias.cob 'checkout -b'
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.br branch

echo -e "${GREEN_TICK} Git has been successfully configured.${NC}"
cat ~/.gitconfig
