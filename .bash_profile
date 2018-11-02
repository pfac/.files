#!/usr/bin/env bash

if [[ -z "${BASH_PROFILE+'true'}" ]]; then
  export BASH_PROFILE='true'

  source "${HOME}/.bashrc"
  source "${HOME}/.profile"

  require 'git'
  require 'mkcd'
  require 'pg'
  require 'prompt'
  require 'proxy'
fi
