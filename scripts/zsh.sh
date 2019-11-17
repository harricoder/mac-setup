# Zsh stuff
# Note dotfiles need to be copied before this runs to ensure the default
# symlinked files are not used.
FILE=${HOME}/.zshrc
if ! [ -f "$FILE" ]; then
    echo "$FILE does not exist, adding locally stored file..."
    cp ./dotfiles/.zshrc ${HOME}/.zshrc
fi

if ! [ -d "${HOME}/.zprezto" ]; then
    echo "cloning prezto repo and setting up configs..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

    /usr/local/bin/zsh -c '
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    '
fi

# Changes the default user shell to zsh
chsh -s /bin/zsh

echo -e "${GREEN_TICK} ZSH and prezto successfully configured.${NC}"
