#!/usr/bin/env zsh

if [[ -z "${ZSHRC+true}" ]]; then
  export ZSHRC;

  source "${HOME}/.shrc"

  export HISTFILE="${HOME}/.zhistory";
  export HISTSIZE=1000;
  export SAVEHIST=10000;
fi
