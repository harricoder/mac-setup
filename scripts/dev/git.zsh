#!/usr/bin/env zsh
#
# Git and git configs.
echo "setting up git..."
cp ./dotfiles/.gitignore ~/.gitignore

# Only ask for username if not already added into configs
if ! [ "$(grep 'email =' ~/.gitconfig)" ]; then
  read "name?Enter Your Git display name: "
  git config --global user.name "$name"

  read  "email?Enter Your Git email address: "
  git config --global user.email "$email"
fi

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
