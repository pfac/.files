#!/usr/bin/env sh
#

nvm () {
  echo "Initializing NVM..." 1>&2;
  unset -f nvm;
  export NVM_DIR=~/.nvm
  source $(brew --prefix nvm)/nvm.sh
  nvm "$@"
}
