#!/usr/bin/env bash

source "$HOME/.bashrc"
source "$HOME/.profile"

#
# Git completions through Homebrew
#
command -v brew &>/dev/null && \
  command -v git &>/dev/null && \
    [ -f "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash" ] && \
    . "$(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash"

#
# Prompt generation
#
__bash_prompt () {
  # Result of the last command
  local last_result=$?

  # Current system: user@hostname:current_directory
  local precmd='\[\e[37;1m\]\u@\h\[\e[0m\]:\[\e[34m\]\w\[\e[0m\]'

  # Git info (depends on git-prompt command)
  command -v git-prompt &>/dev/null && \
    [ "$(git-prompt)" ] && \
      precmd="$precmd [$(git-prompt)]"

  # Prompt: shell symbol or root symbol, red if last command failed
  local prompt
  if [ $last_result == 0 ]; then
    prompt='\[\e[32m\]✓ \$\[\e[0m\] '
  else
    prompt='\[\e[31m\]✗ \$\[\e[0m\] '
  fi

  PS1="\n$precmd\n$prompt"
}
PROMPT_COMMAND=__bash_prompt