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

man_prompt "Run termianl command (zsh completions): compaudit | xargs chmod g-w"
man_prompt "Copy across iTerm2 User profile (and set as default)"
man_prompt "Turn on Firewall"
man_prompt "Allow Logi Options access in Security & Privacy security settings and connect devices"
man_prompt "Sign in to Dashlane and set to display in menu bar and install browser extensions"
man_prompt "Sign in to Google Chrome"
man_prompt "Sign in to Jetbrains toolbox and install all apps"
man_prompt "Sign in to Creatve Cloud and install all apps / give disk access in Security"
man_prompt "Sign in to Unity Hub and download installation/plugins"
man_prompt "Sign in to Office 365"
man_prompt "Sign in to Todoist"
man_prompt "Sign in to Parallels"
man_prompt "Enter serial for Sketch"
man_prompt "Enter serial for Transmit"
man_prompt "Copy across all files from previous timemachine backup"
man_prompt "Setup Parallels: allow security access and copy across previous VMs"
man_prompt "Install Elgato Stream Deck Profile (from cloud backup)"
man_prompt "Finder: sidebar - display HD and home dir, etc. General - hide CDs / DVDs. New - open docs"
man_prompt "Adjust monitor arrangement in settings"
man_prompt "Update: Profile Image, Desktop Background and Screen saver"
man_prompt "Copy across or create new ssh key -> add to bitbucket, github, etc"
man_prompt "Plug in iphone and backup"


echo
echo -e "${GREEN_TICK} Manual actions are all complete.${NC}"
