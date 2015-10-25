#!/bin/bash
#
# Configures the shell prompt.
#

require 'libexec'
require 'git/prompt'

dotfiles_setup_prompt () {
	local console_token_color;
	local prefix;
	local suffix;

	if [ "$?" == "0" ];
	then
		console_token_color='green';
	else
		console_token_color='red';
	fi;

	local user=`mspaint -b black -f white -w '\u'`
	local user_host_separator=`mspaint -B -b black -f white -w @`
	local host=`mspaint -b black -f white '\H'`
	local host_dir_separator="$(mspaint -b black -f white ':')$(mspaint -f black '') "
	local dir=`mspaint -f blue -w '\w'`
	local dir_git_separator=' '
	prefix="\n$user$user_host_separator$host$host_dir_separator$dir$dir_git_separator";

	local history=`mspaint -f $console_token_color -w '\!'`
	local history_shell_separator=' '
	local shell=`mspaint -f $console_token_color -w '\$'`
	suffix="\n $history$history_shell_separator$shell "

	export GIT_PS1_SHOWCOLORHINTS=true;
	__git_ps1 "$prefix" "$suffix" "[%s]"
}

PROMPT_COMMAND=dotfiles_setup_prompt
