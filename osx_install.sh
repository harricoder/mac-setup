#!/usr/bin/env bash
# Credits:
#   Inspired by:
#   https://gist.github.com/t-io/8255711
#   and
#   https://gist.github.com/kyleparisi/a5b9b1f59be5ea8791c3
source ./scripts/constants.sh

echo
echo -e "${PURPLE}Hey ${USER}, let's setup your mac...${NC}"

# Make sure the bash profile file exists (needed for script process).
FILE=~/.bash_profile
if ! [ -f "$FILE" ]; then
  touch "${FILE}"
fi

function do_action() {
  ACTION=$1
  SCRIPT=$2
  echo
  echo -e "${GREEN}${ACTION}${NC}"
  select yn in "Yes" "No"; do
      case $yn in
          Yes ) ./scripts/${SCRIPT}; break;;
          No ) break;;
      esac
  done
}

do_action "Install brew and cask?" "brew.sh"
do_action "Install MAS?" "mas.sh"
do_action "Install Node via nvm?" "node.sh"
do_action "Install Programming language additionals?" "prog_languages.sh"
do_action "Configure Git?" "git.sh"
do_action "Copy dotfiles and configs?" "dotfiles_config.sh"
do_action "Install zsh / prezto things?" "zsh.sh"
do_action "Go through non-automated things?" "manual_input.sh"

# Final output
echo
echo -e "${YELLOW}- - - - - - EVERYTHING IS AWESOME! - - - - - -"
cat << "EOF"

                _ _,---._
       ,-','       `-.___
      /-;'               `._
     /\/          ._   _,'o \
    ( /\       _,--'\,','"`. )
     |\      ,'o     \'    //\
     |      \        /   ,--'""`-.
     :       \_    _/ ,-'         `-._
      \        `--'  /                )
       `.  \`._    ,'     ________,','
         .--`     ,'  ,--` __\___,;'
          \`.,-- ,' ,`_)--'  /`.,'
           \( ;  | | )      (`-/
             `--'| |)       |-/
               | | |        | |
               | | |,.,-.   | |_
               | `./ /   )---`  )
              _|  /    ,',   ,-'
             ,'|_(    /-<._,' |--,
             |    `--'---.     \/ \
             |          / \    /\  \
           ,-^---._     |  \  /  \  \
        ,-'        \----'   \/    \--`.
       /            \              \   \

------------------------------------------------
+ + + G O O D  J O B  -   A L L  D O N E ! + + +
EOF
echo -e "${NC}"
