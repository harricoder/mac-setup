# Git and git configs.
echo "setting up git..."
cp ./dotfiles/.gitignore ${HOME}/.gitignore

git config --global core.excludesfile ${HOME}/.gitignore
git config --global core.editor "vim"

if ! [ "$(grep 'email =' ~/.gitconfig)" ]; then
  read -p "Enter Your Git display name: "  name
  git config --global user.name "$name"

  read -p "Enter Your Git email address: "  email
  git config --global user.email "$email"
fi

echo -e "${GREEN_TICK} Git has been successfully configured.${NC}"
git config --list
