#!/usr/bin/env zsh

if [[ -z "${ZPROFILE+true}" ]]; then
  export ZPROFILE;

  source "${HOME}/.zshrc"
  source "${HOME}/.profile"

  echo -n "* Configuring ZSH profile... "

  # Tab completion
  autoload -U compinit
  compinit

  # Prompt
  autoload -U colors && colors
  autoload -U promptinit && promptinit

  # Print the first lines of the prompt.
  #
  # Sources:
  #
  # - color stripping command from http://stackoverflow.com/a/10564843
  #
  precmd () {
    local left=`print -P "%{$fg_bold[white]%}%n@%M:%{$reset_color%}%F{blue}%~%f %{$fg_bold[black]%}(%l)%{$reset_color%}"`
    local leftplain=`sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" <<< "$left"`
    local right=`~/local/bin/git-prompt`
    local rightwidth=$(($COLUMNS - ${#leftplain}))

    print -l '' "${left}${(l:$rightwidth:)right}"
  }
  export PROMPT="%(?,%F{green}✓ %#%f,%F{red}✗ %#%f) "

  echo "DONE"
fi

clear
