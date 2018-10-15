#!/usr/bin/env sh

if [[ -z "${PROFILE+true}" ]]; then
  export PROFILE;
  echo -n "* Configuring generic profile... "

  case `uname` in
    Darwin)
      alias ls='/bin/ls -G'
      export TERM='xterm-256color'
      ;;
    Linux)
      alias ls='/bin/ls --color'
      alias open='xdg-open'
      ;;
  esac

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

  # TMUX
  unalias tmux &> /dev/null
  alias tmux="$(which tmux) -2"
  if [ "$TMUX" ]; then
    export TERM='screen-256color'
  fi


  # single letter shortcuts
  alias b='bundle'
  alias be='bundle exec'
  alias g='git'
  alias r='bundle exec rails'
  alias rk='bundle exec rake'
  alias t='tmux'
  if which nvim &> /dev/null; then
    export EDITOR='nvim'
  elif which vim &> /dev/null; then
    export EDITOR='vim'
  else
    export EDITOR='vi'
  fi
  alias v="$EDITOR"

  ! type pbcopy &> /dev/null &&
    type xclip &> /dev/null &&
    alias pbcopy='xclip -selection clipboard'

  ! type pbpaste &> /dev/null &&
    type xclip &> /dev/null &&
  alias pbpaste='xclip -selection clipboard -o'

  # FZF
  # --files: List files that would be searched but do not search
  # --hidden: Include hidden files and folders
  # --follow: Follow symlinks
  # --glob: Additional conditions for search
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

  # Enable history in Erlang VM console (for IEx)
  export ERL_AFLAGS="-kernel shell_history enabled"

  echo "DONE"
fi
