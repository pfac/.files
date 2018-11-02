#!/usr/bin/env bash

if [[ -z "${BASH_PROFILE+'loaded'}" ]]; then
  export BASH_PROFILE='loaded'

  source "${HOME}/.bashrc"
  source "${HOME}/.profile"

  echo -n "* Configuring Bash profile... "

  #
  # Git completions through Homebrew
  #
  if which brew >/dev/null 2>&1 \
    && which git >/dev/null 2>&1 \
    && [ -f "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash" ]; then
    # Load completions from bash_completion
    source "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash"
  fi

  #
  # Prompt
  #
  __bash_prompt () {
    local __bash_prompt_last_result=$?
    local __bash_prompt_system
    local __bash_prompt_git
    local __bash_prompt_prefix

    # Current system: user@hostname:current_directory
    __bash_prompt_system="\\[\\e[37;1m\\]\\u@\\h\\[\\e[0m\\]:\\[\\e[34m\\]\\w\\[\\e[0m\\]"

    # Git info (depends on git-prompt command)
    if which git-prompt >/dev/null 2>&1 && [ "$(git-prompt)" ]; then
      __bash_prompt_git="[$(git-prompt)]"
    fi

    # Prefix: shell symbol or root symbol, red if last command failed
    if [ $__bash_prompt_last_result == 0 ]; then
      __bash_prompt_prefix='\[\e[32m\]✓ \$\[\e[0m\]'
    else
      __bash_prompt_prefix='\[\e[31m\]✗ \$\[\e[0m\]'
    fi

    PS1="\n$__bash_prompt_system $__bash_prompt_git\n$__bash_prompt_prefix "
  }
  PROMPT_COMMAND=__bash_prompt

  echo "DONE"
fi
