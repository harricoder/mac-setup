# Node and various configs.
#   * This loads nvm
#   * This loads nvm bash_completion
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Go
export GOPATH="$HOME/Projects/Go"
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# Aliases
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Load Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
