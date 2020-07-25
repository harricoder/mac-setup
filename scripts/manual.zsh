#!/usr/bin/env zsh
#
# Manual things:
#
# Some things just can't be automated, make a note of any 'things' that need
# setting up manually - that is to say they can't currently be automated, or
# are just too awkward to do so at the moment
function man_prompt {
  echo
  echo -e "${YELLOW}$1${NC}"
  echo "Press any key to continue... "
  read -k 1 -s
  echo
}

man_prompt "Copy across iTerm2 User profile"
man_prompt "Turn on FileVault and Firewall"
man_prompt "Allow Logi Options access in Security & Privacy security settings"
man_prompt "Adjust monitor arrangement in settings"
man_prompt "Update: Profile Image, Desktop Background and Screen saver"
man_prompt "Install Elgato Stream Deck Profile (from cloud backup)"
man_prompt "Sign in to Dashlane and set to display in menu bar"
man_prompt "Sign in to Jetbrains toolbox and install all apps"
man_prompt "Sign in to Creatve Cloud and install all apps"
man_prompt "Copy across or create new ssh key -> add to bitbucket, github, etc"
man_prompt "Plug in iphone and turn off auto sync in itunes and photos"
man_prompt "Copy across all files from previous timemachine backup"

echo
echo -e "${GREEN_TICK} Manual actions are all complete.${NC}"
