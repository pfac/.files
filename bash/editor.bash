#!/usr/bin/env bash

# if vim is installed, use it as default editor
if which vim &> /dev/null; then
	export EDITOR=vim
# else try to fallback to emacs
elif which emacs &> /dev/null; then
	export EDITOR=emacs
fi
