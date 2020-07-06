#!/usr/bin/env bash
#
# Manual things:
# Some things just can't be automated, make a note of any 'things' that need
# setting up manually - that is to say they can't currently be automated, or
# are just too awkward to do so at the moment.
function man_prompt {
  echo
  echo -e "${YELLOW}$1${NC}"
  read -rp "Press any key to continue... " -n1 -s
  echo
}

man_prompt "Plug in iphone and turn off auto sync in itunes and photos"
man_prompt "Copy across iTerm2 User profile"
man_prompt "Update: Profile Image, Desktop Background and Screen saver"
man_prompt "Install Elgato Stream Deck Profile (from cloud backup)"
man_prompt "Copy across or create new ssh key -> add to bitbucket, github, etc"

echo
echo -e "${GREEN_TICK} Manual actions are all done.${NC}"
