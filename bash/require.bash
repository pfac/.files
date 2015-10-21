#!/usr/bin/env bash
#

require () {
	for module in "$@"; do
		if [ -f "${DOTFILES}/lib/${module}.bash" ]; then
			source "${DOTFILES}/lib/${module}.bash";
		elif [ -f "${DOTFILES}/bash/${module}.bash" ]; then
			source "${DOTFILES}/bash/${module}.bash";
		else
			echo "Error: Module '$module' not found" 1>&2;
		fi;
	done;
}
