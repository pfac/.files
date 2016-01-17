#!/usr/bin/env bash

if which brew &> /dev/null; then
  require 'brew/lmod'
fi

module use $DOTFILES/lmod/modulefiles
