#!/bin/bash
#
# radio - Shortcut to use 'mplayer' to listen to an online radio through the
#         command line

radio () {
	command="mplayer";
	if which ${command};
	then
		case "$1" in
		comercial)
			${command} mmsh://195.23.102.196/comercialcbr96
			;;
		*)
			echo "Unknown station \"$1\"" 1>&2;
			;;
		esac;
	else
		echo "${command} not found" 1>&2;
	fi;
}
