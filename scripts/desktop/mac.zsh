#!/usr/bin/env zsh
#
# Set up OSX preferences
#
# Mac Settings:
# These settings are normally only really required on a fresh mac install -
# or if you update them for some reason.
###########################################
echo "This script will change settings in OSX"
echo "Press any key to continue... "
read -k 1 -s

echo ""
echo "Please enter your password..."
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Screen                                                                      #
###############################################################################
echo " - Adjusting screen settings"
# Require password immediately after sleep or screen saver begins
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"


###############################################################################
# Keyboard and Mouse                                                          #
###############################################################################
echo " - Adjusting keyboard and mouse settings"
# Disable “natural” inverted scrolling
defaults write -g com.apple.swipescrolldirection -bool NO

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set Mouse track speed
defaults write -g com.apple.mouse.scaling -int 4


###############################################################################
# Dock, Dashboard, and menus                                                  #
###############################################################################

echo " - Set Dock up (minimise and stuff)"
osascript ./scripts/applescripts/Dock.scpt

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 56 pixels
defaults write com.apple.dock tilesize -int 56

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Prevent recents being shown in docker
defaults write com.apple.dock show-recents -bool false

# Set sidebar icon size to medium
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

# Menu bar: disable transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

killall Dock


###############################################################################
# Photos                                                                      #
###############################################################################

# Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

echo " - Avoid creating .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true


###############################################################################
# Misc                                                                        #
###############################################################################

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

#echo " Empty Trash securely by default"
defaults write com.apple.finder EmptyTrashSecurely -bool true

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo
echo -e "${GREEN_TICK} Settings have been applied (restart once script has finished).${NC}"
