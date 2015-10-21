#!/usr/bin/env bash
#
# topen - Touch a file and open it with default app
#

require 'open'

function topen {
	touch "$@" && open "$@";
}
