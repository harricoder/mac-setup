# Install Apple Store programs (using the most excellent mas):
# see https://github.com/mas-cli/mas
if ! [ -x "$(command -v mas)" ]; then
  echo "installing mas..."
  brew install mas
fi
echo "mas is installed: $(mas version)"

# TODO: Perhaps do this via the` mas signin` feature if it ever gets fixed?
echo -e "${YELLOW}"
read -rp "Please ensure you are signed into to Apple App Store before continuing... " -n1 -s

echo -e "${NC}"
mas install 497799835  # Xcode (10.3)
mas install 425424353  # The Unarchiver (4.1.0)
mas install 552383089  # Dashlane (6.1932.0)
mas install 803453959  # Slack (4.0.2)
mas install 979538493  # Go for Gmail (2.6)
mas install 425264550  # Disk Speed Test (3.2)
mas install 585829637  # Todoist (7.1.3)
mas install 921923693  # LibreOffice Vanilla (6.2.6002)
mas install 1295203466 # Microsoft Remote Desktop (10.2.13)
mas install 784801555  # Microsoft OneNote (16.28)
mas install 462058435  # Microsoft Excel (16.28)
mas install 462054704  # Microsoft Word (16.28)
mas install 985367838  # Microsoft Outlook (16.28)
mas install 462062816  # Microsoft PowerPoint (16.28)

echo
echo -e "${GREEN_TICK} All mas packages succesfully installed:${CYAN}"
mas list
echo -e "${NC}"
