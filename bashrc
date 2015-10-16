#!/bin/bash

reload () {
	source "${DOTFILES}/bash/reset";
	# source "${DOTFILES}/bash/setup";
	# source "${DOTFILES}/bash/config";
	source "${DOTFILES}/bash/env";
	if [ -n "$PS1" ];
	then
		source "${DOTFILES}/bash/i_env"
		source "${DOTFILES}/bash/completions";
		source "${DOTFILES}/bash/git.bash";
		source "${DOTFILES}/bash/aliases.sh";
	fi;
}

reload;
