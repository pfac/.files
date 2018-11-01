#!/usr/bin/env bash

if [[ -z "${BASHRC}" ]]; then
  export BASHRC='loaded'

  source "${HOME}/.shrc"

  # Import require to handle bash modules
  source "${DOTFILES}/bash/require.bash";

  require 'brew/nvm'
  require 'brew/rbenv'
  require 'make'
fi
