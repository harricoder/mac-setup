# Node and various configs.
#   * This loads nvm
#   * This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Go
export GOPATH="$HOME/Projects/Go"
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Aliases
# TODO: turns out this seems to mess with brew's symlinks (find a better way)
# alias python=/usr/local/bin/python3
# alias pip=/usr/local/bin/pip3

# Load Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
