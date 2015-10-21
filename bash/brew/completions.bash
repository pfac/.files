#!/usr/bin/env bash

BREW_BASH_COMPLETION_SCRIPT="$(brew --prefix)/etc/bash_completion";
if [ -f "$BREW_BASH_COMPLETION_SCRIPT" ]; then
	. "$BREW_BASH_COMPLETION_SCRIPT"
fi
