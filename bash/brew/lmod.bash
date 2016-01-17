#!/usr/bin/env bash

# Install lmod if not available
if ! brew ls lmod &> /dev/null; then
  brew install lua
  luarocks install luafilesystem
  luarocks install luaposix
  brew install homebrew/science/lmod
fi

source $(brew --prefix lmod)/init/profile
