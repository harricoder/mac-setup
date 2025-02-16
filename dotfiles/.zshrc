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

# PHP
export PATH=$PATH:$HOME/.composer/vendor/bin

# Python
eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Zsh Completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi

# Go
export GOPATH="$HOME/Projects/Go"

# Aliases
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Load Prezto and other stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source <(fzf --zsh)
