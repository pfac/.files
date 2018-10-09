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

  # Shortcuts
  bindkey "^P" up-line-or-search
  bindkey "^N" down-line-or-search
  bindkey "^R" history-incremental-search-backward

  # Print the first lines of the prompt.
  #
  # Sources:
  #
  # - color stripping command from http://stackoverflow.com/a/10564843
  #
  precmd () {
    local left=`print -P "%{$fg_bold[white]%}%n@%M:%{$reset_color%}%F{blue}%~%f %{$fg_bold[black]%}(%l)%{$reset_color%}"`
    local leftplain=`sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" <<< "$left"`
    local right=`git-prompt`
    local rightwidth=$(($COLUMNS - ${#leftplain}))

    print -l '' "${left}${(l:$rightwidth:)right}"
  }
  export PROMPT="%(?,%F{green}✓ %#%f,%F{red}✗ %#%f) "

  # Enable direnv, if present
  if type -f direnv &>/dev/null; then
    eval "$(direnv hook zsh)"
  fi

  echo "DONE"
else
  echo "  Warning: Trying to load ZPROFILE again"
fi

clear
