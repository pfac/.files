#!/usr/bin/env sh

if [[ -z "${PROFILE+true}" ]]; then
  export PROFILE;
  echo -n "* Configuring generic profile... "

  case `uname` in
    Darwin)
      export TERM='xterm-256color'
      ;;
    Linux)
      alias open='xdg-open'
      ;;
  esac

  # TMUX
  unalias tmux &> /dev/null
  alias tmux="$(which tmux) -2"
  if [ "$TMUX" ]; then
    export TERM='screen-256color'
  fi


  # single letter shortcuts
  alias t='tmux'

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


  #
  # cd
  #
  alias ..='cd ..'

  #
  # Vi
  #
  if which vi >/dev/null 2>&1; then
    export EDITOR='vi'

    # single letter shortcuts
    alias v='vi'
  fi

  #
  # Vim
  #
  if which vim >/dev/null 2>&1; then
    export EDITOR='vim'

    # single letter shortcuts
    alias v='vim'
  fi


  #
  # NeoVim
  #
  if which nvim >/dev/null 2>&1; then
    export EDITOR='nvim'

    # single letter shortcuts
    alias v='nvim'
  fi

  #
  # Git
  #
  if which git >/dev/null 2>&1; then
    # single letter shortcuts
    alias g='git'

    # completion
    __git_complete g _git
  fi

  #
  # Ruby
  #
  if which ruby >/dev/null 2>&1; then
    # single letter shortcuts
    alias b='bundle'
    alias be='bundle exec'
    alias r='bundle exec rails'
    alias rk='bundle exec rake'
  fi

  echo "DONE"
fi
