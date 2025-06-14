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
export PATH="$HOME/.local/bin:$PATH"

# PHP
export PATH=$PATH:$HOME/.composer/vendor/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Go
export GOPATH="$HOME/Projects/Go"

# Initialize Homebrew
if [ -f "/opt/homebrew/bin/brew" ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f "/usr/local/bin/brew" ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

# Zsh Completion
if type brew &>/dev/null; then
  FPATH="$(brew --prefix)/share/zsh-completions:$FPATH"

  autoload -Uz compinit
  compinit
fi

# Aliases
alias ios="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"

# Load Prezto and other stuff
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

# Load zsh-syntax-highlighting
if [ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# Load fzf
if [ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]; then
    source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
fi
