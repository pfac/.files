#!/usr/bin/env bash
#
# cdls - Change directory and list its files

require 'ls'

cdls () {
	builtin cd "$@" && ls;
}
