#!/usr/bin/env bash

if [[ -z "${BASH_PROFILE+'true'}" ]]; then
  export BASH_PROFILE='true'

  source "${HOME}/.bashrc"
  source "${HOME}/.profile"

  #
  # Git completions through Homebrew
  #
  if [ -f "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash" ]; then
    # Load completions from bash_completion
    source "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash"
  fi

  require 'prompt'
  require 'proxy'
fi
