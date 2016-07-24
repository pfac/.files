#!/usr/bin/env sh

source "${HOME}/.shrc"

case `uname` in
  Linux)
    alias ls='/bin/ls --color'
    alias open='xdg-open'
    ;;
esac

# alias_exists
alias_exists () {
  local alias_name="$1"
  local description=`whence -w "$alias_name" | grep "${alias_name}: alias"`

  [ -n "$description" ]
}

# cdls
cdls () {
  builtin cd "$@" && ls;
}

# cd
alias cd='cdls'
alias ..='cd ..'

# mkcd
mkcd () {
  mkdir -p "$@" && cd "$@";
}

# tmux
if alias_exists tmux; then unalias tmux; fi
alias tmux="$(which tmux) -2"

# single letter shortcuts
alias b=bundle
alias g=git
alias r=rails
alias rk=rake
alias t=tmux
if which nvim &> /dev/null; then
  alias v=nvim
else
  alias v=vim
fi


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
