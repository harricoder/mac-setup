#!/usr/bin/env zsh
#
# Git and git configs.
echo "setting up git..."
cp ./dotfiles/.gitignore ~/.gitignore

git config --global core.excludesfile ~/.gitignore
git config --global core.editor "vim"

if ! [ "$(grep 'email =' ~/.gitconfig)" ]; then
  read "name?Enter Your Git display name: "
  git config --global user.name "$name"

  read  "email?Enter Your Git email address: "
  git config --global user.email "$email"

  echo "setting pull strategy to fast-forward only..."
  git config --global pull.ff only
fi

echo -e "${GREEN_TICK} Git has been successfully configured.${NC}"
git config --list
