#!/usr/bin/env bash
#
# Load bash configuration for Git
#

require 'brew/git'

alias g='git'
__git_complete g _git
