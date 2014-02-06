#!/bin/bash

reload () {
	source "${UNIXCONFDIR}/bash/reset";
	# source "${UNIXCONFDIR}/bash/setup";
	# source "${UNIXCONFDIR}/bash/config";
	source "${UNIXCONFDIR}/bash/env";
	if [ -n "$PS1" ];
	then
		source "${UNIXCONFDIR}/bash/i_env"
		source "${UNIXCONFDIR}/bash/aliases";
		source "${UNIXCONFDIR}/bash/completions";
	fi;
}

reload;
