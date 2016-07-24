#!/usr/bin/env zsh

source "${HOME}/.shrc"

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

export PATH="$HOME/.rvm/bin:$PATH" # Add RVM to PATH for scripting
