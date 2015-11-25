#!/usr/bin/env sh
#

if which rbenv > /dev/null; then
  eval "$(rbenv init --no-rehash -)";
  disown rbenv rehash &> /dev/null
  [ -n "$DOTFILES_VERBOSE" ] && echo "✓ Initialized rbenv" 1>&2;
fi
