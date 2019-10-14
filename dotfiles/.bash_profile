# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Aliases
alias python=/usr/local/bin/python3
alias pip=/usr/local/bin/pip3

# Environent
export GOPATH="$HOME/Projects/Go"
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion