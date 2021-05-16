#!/usr/bin/env zsh
#
# Manual things:
#
# Some things just can't be automated, make a note of any 'things' that need
# setting up manually - that is to say they can't currently be automated, I
# would rather manually do them, or are just too awkward to do so at the moment.
function man_prompt {
  echo
  echo -e "${YELLOW}$1${NC}"
  echo "Press any key to continue... "
  read -k 1 -s
  echo
}

man_prompt "Adjust monitor arrangement in settings"
man_prompt "Turn on Firewall"
man_prompt "Allow Logi Options access in Security & Privacy security settings - connect devices / set open at login"
man_prompt "Sign in to Dashlane and set to display in menu bar and install browser extensions"
man_prompt "Sign in to Google Chrome"
man_prompt "Sign in to Office 365"
man_prompt "Sign in to Todoist"
man_prompt "Install Elgato Stream Deck Profile and plugins (from cloud backup)"
man_prompt "Finder: sidebar - display HD and home dir, etc. General - hide CDs / DVDs. New - open docs"
man_prompt "Update: Profile Image, Desktop Background and Screen saver"
man_prompt "Tidy up and organise the Dock - remove unused, etc"


echo
echo -e "${GREEN_TICK} Manual actions are all complete.${NC}"
