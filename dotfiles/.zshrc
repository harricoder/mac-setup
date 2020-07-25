# Node and various configs.
#   This loads:
#     * NVM
#     * Pyenv (python version switcher)
#     * zsh completions
#     * Go projects
#     * prezto
#     * aliases
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Python
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Zsh Completion
if type brew &>/dev/null; then
  # Additional changes as advised by zsh-completions (fix permissions)
  compaudit | xargs chmod g-w

  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Go
export GOPATH="$HOME/Projects/Go"

# Aliases
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Load Prezto
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
