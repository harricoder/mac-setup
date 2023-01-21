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
# Energy saving                                                               #
###############################################################################

# Disable these until settings are defined for new Macbook.
 
# echo " - Automatically illuminate built-in MacBook keyboard in low light"
# defaults write com.apple.BezelServices kDim -bool true

# echo " - Turn off keyboard illumination when computer is not used for 5 minutes"
# defaults write com.apple.BezelServices kDimTime -int 300

# echo " - Enable lid wakeup"
# sudo pmset -a lidwake 1

# echo " - Disable wake when connect to power"
# sudo pmset -a acwake 0

# echo " - Restart automatically on power loss"
# sudo pmset -a autorestart 1

# echo " - Restart automatically if the computer freezes"
# sudo systemsetup -setrestartfreeze on

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk powers memory but not disk
# 25: As above but also removes power to memory

# Disable these until settings are defined for new Macbook.

# echo " - Set RAM hibernation mode"
# sudo pmset -a hibernatemode 3

# echo " - Set high standby delay before writing hiberation file - 24 hrs"
# sudo pmset -a autopoweroff 1
# sudo pmset -a standby 1
# sudo pmset -a standbydelayhigh 86400
# sudo pmset -a standbydelaylow 10800
# sudo pmset -a highstandbythreshold 50
# # Sleep intermediate half-brightness state between full brightness and fully off
# sudo pmset -a halfdim 1

# echo " - Set auto power off (hibernate) to 8 hrs"
# sudo pmset -a autopoweroffdelay 28800

# echo " - Ensure tty does not prevent sleep"
# sudo pmset -a ttyskeepawake 0

# echo " - Disable the sudden motion sensor as it’s not useful for SSDs"
# sudo pmset -a sms 0

# echo " - Adjusting battery energy saving settings"
# sudo pmset -b powernap 0
# sudo pmset -b lessbright 1
# sudo pmset -b displaysleep 60
# sudo pmset -b disksleep 10
# sudo pmset -b powernap 0
# sudo pmset -b sleep 60
# sudo pmset -b womp 0

# echo " - Adjusting AC energy saving settings"
# sudo pmset -c powernap 1
# sudo pmset -c lessbright 0
# sudo pmset -c displaysleep 180
# sudo pmset -c disksleep 0
# sudo pmset -c powernap 1
# sudo pmset -c sleep 0
# sudo pmset -c womp 1


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

# Stop iTunes from responding to the keyboard media keys
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2> /dev/null

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Set Mouse track speed
defaults write -g com.apple.mouse.scaling -int 3


###############################################################################
# Dock, Dashboard, and menus                                                  #
###############################################################################

echo " - Set Dock up (minimise and stuff)"
osascript ./scripts/applescripts/Dock.scpt

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Remove the auto-hiding Dock delay
#defaults write com.apple.dock autohide-delay -float 0
#
## Remove the animation when hiding/showing the Dock
#defaults write com.apple.dock autohide-time-modifier -float 0

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Only show currently opened apps in dock
#defaults write com.apple.dock static-only -bool true

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

#echo " Finder: show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

# Allow OpenEMU to function properly
xattr -d com.apple.quarantine /Applications/OpenEmu.app


echo
echo -e "${GREEN_TICK} Settings have been applied (restart once script has finished).${NC}"
