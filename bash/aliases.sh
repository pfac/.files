#!/bin/bash

if [ `uname` == 'Darwin' ];
then
	alias ls="/bin/ls -FG";
	alias pg='pg_ctl -D /usr/local/var/postgres'
else
	alias ls="/bin/ls -F --color";
fi;

# cdls
#	Change directory and list it
cdls () {
	cd "$@" && ls;
}

alias cd="cdls";


alias .='ls';
alias ..='cdls ..';

alias lla='ls -la';

#	mkcd
#	Make a directory and change the working directory
function mkcd {
	/bin/mkdir -p "$@" && cdls "$@";
}

# topen
# Touch a file and open it with default app
function topen {
	touch "$1";
	if [ `uname` == 'Darwin' ]; then
		open "$1";
	else
		xdg-open "$1";
	fi
}

# By default, don't let make print the directory (it's really annoying)
alias make='make --no-print-directory';

# Load proxies into the environment
alias proxy="source \"${UNIXCONFDIR}/bash/proxy\""

# One-Letters
#############
if which git &> /dev/null; then alias g='git'; fi;
if which rails &> /dev/null; then alias r='rails'; fi;

# Extras
########
source "${UNIXCONFDIR}/bash/radio";
source "${UNIXCONFDIR}/bash/stats";
