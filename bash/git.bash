#!/usr/bin/env bash
#
# Load bash configuration for Git
#

load_git() {
  source "${DOTFILES}/bash/git/completions.bash"

  load_git_completion
}

load_git
