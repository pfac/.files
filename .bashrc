#!/usr/bin/env bash

if [[ -z "${BASHRC}" ]]; then
  export BASHRC='loaded'

  source "${HOME}/.shrc"

  # Import require to handle bash modules
  source "${DOTFILES}/bash/require.bash";

  #
  # History
  #

  # Add timestamp to command on output
  # (useful to match with logs)
  export HISTTIMEFORMAT="%h %d %H:%M:%S> "

  # Ignore duplicate commands in a row
  export HISTCONTROL=ignoredups

  # Increase number of lines in history
  export HISTSIZE=10000000
fi
