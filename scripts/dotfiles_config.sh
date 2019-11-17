# Copy across dotfiles and configs (may want to symlink instead)
# Other configs and dotfiles (overrites previous files in some cases)
# This actually dupes some dotfiles - but that does not really matter,
# better to be safer than sorry?

# TODO: could symlinks these?
cp $PWD/dotfiles/.bash_profile ~/.bash_profile
cp $PWD/dotfiles/.zshrc ~/.zshrc
cp $PWD/dotfiles/.zpreztorc ~/.zpreztorc
cp $PWD/dotfiles/.gitignore ~/.gitignore

source ~/.bash_profile

# Additional configs here.
# TODO: how to import iTerm profile via script?

echo -e "${GREEN_TICK} All dotfiles and configs copied successfully.${NC}"
