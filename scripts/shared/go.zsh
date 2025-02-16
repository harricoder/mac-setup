#!/usr/bin/env zsh
#
# Other Golang bits
if ! [ "$(grep GOPATH ~/.zshrc)" ]; then
  if ! [ -d "~/Projects/Go" ]; then
      mkdir -p ~/Projects/Go
  fi

  echo 'export GOPATH="$HOME/Projects/Go"' >> ~/.zshrc

  source ~/.zshrc
fi
go install golang.org/x/tools/cmd/godoc@latest

echo -e "${GREEN_TICK} Go has been successfully configured.${NC}"
