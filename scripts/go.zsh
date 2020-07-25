#!/usr/bin/env zsh
#
# Other Golang bits
if ! [ "$(grep GOPATH ~/.zshrc)" ]; then
  if ! [ -d "~/Projects/Go" ]; then
      mkdir -p ~/Projects/Go
  fi

  # TODO: should not need to export this
  echo 'export GOPATH="$HOME/Projects/Go"' >> ~/.zshrc

  source ~/.zshrc
fi
go get golang.org/x/tools/cmd/godoc

echo -e "${GREEN_TICK} Go has been successfully configured.${NC}"
