#!/usr/bin/env bash
#
# Customizations for Git installed through Homebrew

# Load completions
source $(brew --cellar)/git/$(git --version | cut -d\  -f3)/etc/bash_completion.d/git-completion.bash
