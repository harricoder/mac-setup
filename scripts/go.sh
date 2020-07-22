#!/usr/bin/env bash
#
# Other Golang bits
if ! [ "$(grep GOPATH ~/.bash_profile)" ]; then
  if ! [ -d "~/Projects/Go" ]; then
      mkdir -p ~/Projects/Go
  fi

  # TODO: should not beed to export this - especially to bash
  echo 'export GOPATH="$HOME/Projects/Go"' >> ~/.bash_profile

  source ~/.bash_profile
fi
go get golang.org/x/tools/cmd/godoc

echo -e "${GREEN_TICK} Go has been successfully configured.${NC}"
