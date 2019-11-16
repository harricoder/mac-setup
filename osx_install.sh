#!/usr/bin/env bash
# Credits:
#   Inspired by:
#   https://gist.github.com/t-io/8255711
#   and
#   https://gist.github.com/kyleparisi/a5b9b1f59be5ea8791c3
source ./scripts/constants.sh

echo
echo -e "${PURPLE}Hey ${USER}, let's do this thing (setup your mac)...${NC}"

# Make sure the bash profile file exists.
FILE=~/.bash_profile
if ! [ -f "$FILE" ]; then
  touch "${FILE}"
fi

echo
echo -e "${GREEN}Install brew and cask?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/brew.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Install MAS?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/mas.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Install Node via nvm?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/node.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Install Python, Go and other bits?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/prog_languages.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Set up Git?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/git.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Install zsh / prezto things?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/zsh.sh; break;;
        No ) break;;
    esac
done

echo
echo -e "${GREEN}Go through non-automated things?${NC}"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) ./scripts/manual_input.sh; break;;
        No ) break;;
    esac
done

# Other configs and dotfiles (overrites previous files in some cases)
echo
echo "copying dotfiles and configs..."
cp ./dotfiles/.bash_profile ~/.bash_profile
source ~/.bash_profile

# Final output
echo -e "${YELLOW}"
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
+ + + A W E S O M E   -   A L L  D O N E ! + + +
EOF
echo -e "${NC}"
