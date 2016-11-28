#!/usr/bin/env sh

if [[ -z "${PROFILE+true}" ]]; then
  export PROFILE;
  echo -n "* Configuring generic profile... "

  case `uname` in
    Darwin)
      alias ls='/bin/ls -G'
      ;;
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
  alias b='bundle'
  alias be='bundle exec'
  alias g='git'
  alias r='bundle exec rails'
  alias rk='bundle exec rake'
  alias t='tmux'
  if which nvim &> /dev/null; then
    alias v='nvim'
  else
    alias v='vim'
  fi

  ! type pbcopy &> /dev/null &&
    type xclip &> /dev/null &&
    alias pbcopy='xclip -selection clipboard'

  ! type pbpaste &> /dev/null &&
    type xclip &> /dev/null &&
  alias pbpaste='xclip -selection clipboard -o'

  echo "DONE"
fi
