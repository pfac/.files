#!/usr/bin/env sh
#

if which rbenv > /dev/null; then
  rbenv () {
    echo "Initializing rbenv..." 1>&2;
    unset -f rbenv;
    eval "$(rbenv init -)";
    rbenv "$@";
  }
fi
