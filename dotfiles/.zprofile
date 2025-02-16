# Needed for pyenv
eval "$(/opt/homebrew/bin/brew shellenv)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Added by Toolbox App
export PATH="$PATH:/Users/steve/Library/Application Support/JetBrains/Toolbox/scripts"
