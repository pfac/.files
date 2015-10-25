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


	prefix="\n$(mspaint -b black -f white -w "\\u")$(mspaint -B -b black -f white -w @)$(mspaint -b black -f white "\\H:")$(mspaint -f black '') $(mspaint -f blue -w "\\w")  ";

	export GIT_PS1_SHOWCOLORHINTS=true;
	__git_ps1 "$prefix" "\n $(mspaint -f $console_token_color -w "\\$") " "[%s]"
}

PROMPT_COMMAND=dotfiles_setup_prompt
