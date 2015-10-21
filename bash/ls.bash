#!/usr/bin/env bash
#
# Customizations for /bin/ls

# Enable colors by default
case `uname` in
Darwin)
	cmd='/bin/ls -FG';
	;;
*)
	cmd='/bin/ls -F --color';
	;;
esac

# Convenience shortcuts
alias ls="$cmd"
alias ll="${cmd} -l"
alias lla="${cmd} -la"
