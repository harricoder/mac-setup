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
mas install 552383089   # Dashlane
mas install 803453959   # Slack
mas install 979538493   # Go for Gmail
mas install 425264550   # Blackmagic Disk Speed Test
mas install 585829637   # Todoist
mas install 921923693   # LibreOffice Vanilla
mas install 1295203466  # Microsoft Remote Desktop
mas install 784801555   # Microsoft OneNote
mas install 462058435   # Microsoft Excel 365
mas install 462054704   # Microsoft Word 365
mas install 985367838   # Microsoft Outlook 365
mas install 462062816   # Microsoft PowerPoint 365
mas install 1284863847  # Unsplash Wallpapers
mas install 1518425043  # Boop
mas install 1528890965  # TextSniper
mas install 441258766   # Magnet

echo
echo -e "${GREEN_TICK} All mas packages successfully installed:${CYAN}"
mas list
echo -e "${NC}"
