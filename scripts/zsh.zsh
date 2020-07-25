#!/usr/bin/env zsh
#
# Zsh stuff
#
# Note dotfiles need to be copied before this runs to ensure the default
# symlinked files are not used.
source ./scripts/_utils.zsh

# Provide warning to user, since it will get overriden EVERYTIME now!
ask_for_confirmation "This will override your .zshrc - OK to continue?"
cp ./dotfiles/.zshrc ${HOME}/.zshrc

if ! [ -d "${HOME}/.zprezto" ]; then
    echo "cloning prezto repo and setting up configs..."
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"

    /bin/zsh -c '
    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
      ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    '
fi

echo -e "${GREEN_TICK} ZSH and prezto successfully configured.${NC}"
