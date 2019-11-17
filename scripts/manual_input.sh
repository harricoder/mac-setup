# Manual things:
# Some things just can't be automated, make a note of any 'things' that need
# setting up manually - that is to say they can't currently be automated, or
# are just too awkward to do so at the moment.
function man_prompt {
  echo
  echo $1
  read -rp "Press any key to continue... " -n1 -s
  echo
}

man_prompt "Plug in iphone and turn off auto sync in itunes and photos"
man_prompt "Copy across iTerm2 User profile"
man_prompt "Update: Profile Image, Desktop Background, Screen saver"

echo
echo -e "${GREEN_TICK} Manual actions are all done.${NC}"
