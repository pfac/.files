#!/usr/bin/env zsh

if [[ -z "${ZSHRC+true}" ]]; then
  export ZSHRC;

  source "${HOME}/.shrc"
fi
