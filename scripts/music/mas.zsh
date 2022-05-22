#!/usr/bin/env zsh
#
# Install Apple Store programs (using the most excellent mas):
#
# see https://github.com/mas-cli/mas
if ! [ -x "$(command -v mas)" ]; then
  echo "please install mas - use the brew script."
  exit 1
fi
echo "currently installed mas version: $(mas version)"

# TODO: Perhaps do this via the` mas signin` feature if it ever gets fixed?
echo -e "${YELLOW}"
echo "Please ensure you are signed into to Apple App Store before continuing... "
read -k 1 -s

echo -e "${NC}"
mas install 425424353   # The Unarchiver
mas install 497799835   # Xcode
mas install 425264550   # Blackmagic Disk Speed Test
mas install 585829637   # Todoist
mas install 784801555   # Microsoft OneNote
mas install 462058435   # Microsoft Excel 365
mas install 462054704   # Microsoft Word 365

echo
echo -e "${GREEN_TICK} All mas packages successfully installed:${CYAN}"
mas list
echo -e "${NC}"
