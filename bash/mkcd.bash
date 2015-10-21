#!/usr/bin/env bash
#
#	mkcd - Make a directory and change the working directory to the new one
#

require 'cdls'

function mkcd {
	mkdir -p "$@" && cdls "$@";
}
