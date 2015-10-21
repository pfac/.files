#!/bin/bash
#
# Configures the shell prompt.
#

require 'libexec'
require 'git/prompt'

dotfiles_setup_prompt () {
	local console_token_color;
	local git_prompt;
	local git_status;

	if [ "$?" == "0" ];
	then
		console_token_color="green";
	else
		console_token_color="red";
	fi;

	git_status=`GIT_PS1_SHOWCOLORHINTS=1 __git_ps1 "%s"`
	if [ "$git_status" ]; then
		git_prompt="[$git_status]"
	fi

	export PS1="\n\u$(mspaint -B -w @)\H:$(mspaint -f magenta -w "\\w")  $git_prompt\n $(mspaint -f $console_token_color -w "\\$") "
}

PROMPT_COMMAND=dotfiles_setup_prompt
