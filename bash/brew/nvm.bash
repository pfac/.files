#!/usr/bin/env sh
#

__nvm_init () {
  unset -f node;
  unset -f npm;
  unset -f nvm;

  export NVM_DIR=~/.nvm
  [ -n "$DOTFILES_VERBOSE" ] && echo -n "... Initializing NVM" 1>&2;
  source $(brew --prefix nvm)/nvm.sh
  [ -n "$DOTFILES_VERBOSE" ] && echo "✓ Initialized NVM" 1>&2;

  "$@"
}

node () {
  __nvm_init 'node' "$@"
}

npm () {
  __nvm_init 'npm' "$@"
}

nvm () {
  __nvm_init 'nvm' "$@"
}
