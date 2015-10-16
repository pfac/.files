#!/usr/bin/env bash
#
# Load auto-completion information for git
#

load_git_completion() {
  case `uname` in
    Darwin)
      load_git_completion_darwin
      ;;
  esac
}

load_git_completion_darwin () {
  # Look for Homebrew
  if which brew &> /dev/null; then
    load_git_completion_darwin_homebrew
  fi
}

load_git_completion_darwin_homebrew() {
  source $(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash
}
