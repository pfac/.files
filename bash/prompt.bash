#!/bin/bash
#
# Configures the shell prompt.
#

require 'libexec'
require 'git/prompt'

__dotfiles_setup_prompt () {
	local exit_status=$?
	local prefix;
	local suffix;

	__dotfiles_color () {
		if [ "$ITERM_PROFILE" == 'Light' ]; then
			case "$1" in
				user|user_host_separator|host|host_dir_separator)
					case "$2" in
						bg) echo 'black';;
						fg) echo 'white';;
					esac
					;;
				dir)
					case "$2" in
						bg) echo 'default';;
						fg) echo 'blue';;
					esac
					;;
				history|shell)
					case "$2" in
						bg) echo 'default';;
						fg) [ $exit_status == 0 ] && echo 'green' || echo 'red';;
					esac
					;;
				*)
					echo 'default'
					;;
			esac
		else
			case "$1" in
				user|user_host_separator|host|host_dir_separator)
					case "$2" in
						bg) echo 'white';;
						fg) echo 'black';;
					esac
					;;
				dir)
					case "$2" in
						bg) echo 'default';;
						fg) echo 'cyan';;
					esac
					;;
				history|shell)
					case "$2" in
						bg) echo 'default';;
						fg) [ $exit_status == 0 ] && echo 'green' || echo 'red';;
					esac
					;;
				*)
					echo 'default'
					;;
			esac
		fi;
	}

	local user_bg=`__dotfiles_color 'user' 'bg'`
	local user_fg=`__dotfiles_color 'user' 'fg'`
	local user_host_separator_bg=`__dotfiles_color 'user_host_separator' 'bg'`
	local user_host_separator_fg=`__dotfiles_color 'user_host_separator' 'fg'`
	local host_bg=`__dotfiles_color 'host' 'bg'`
	local host_fg=`__dotfiles_color 'host' 'fg'`
	local host_dir_separator_bg=`__dotfiles_color 'host_dir_separator' 'bg'`
	local host_dir_separator_fg=`__dotfiles_color 'host_dir_separator' 'fg'`
	local dir_bg=`__dotfiles_color 'dir' 'bg'`
	local dir_fg=`__dotfiles_color 'dir' 'fg'`
	local history_bg=`__dotfiles_color 'history' 'bg'`
	local history_fg=`__dotfiles_color 'history' 'fg'`
	local history_shell_separator_bg=`__dotfiles_color 'history_shell_separator' 'bg'`
	local history_shell_separator_fg=`__dotfiles_color 'history_shell_separator' 'fg'`
	local shell_bg=`__dotfiles_color 'shell' 'bg'`
	local shell_fg=`__dotfiles_color 'shell' 'fg'`

	local user=`mspaint -b $user_bg -f $user_fg -w '\u'`
	local user_host_separator=`mspaint -B -b $user_host_separator_bg -f $user_host_separator_fg -w @`
	local host=`mspaint -b $host_bg -f $host_fg '\H'`
	local host_dir_separator="$(mspaint -b $host_dir_separator_bg -f $host_dir_separator_fg ':')$(mspaint -b $dir_bg -f $host_dir_separator_bg '') "
	local dir=`mspaint -b $dir_bg -f $dir_fg -w '\w'`
	local dir_git_separator=`mspaint -b $dir_bg ' '`
	prefix="\n$user$user_host_separator$host$host_dir_separator$dir$dir_git_separator";

	local history=`mspaint -b $history_bg -f $history_fg -w '\!'`
	local history_shell_separator=`mspaint -b $history_shell_separator_bg ' '`
	local shell=`mspaint -b $shell_bg -f $shell_fg -w '\$'`
	suffix="\n $history$history_shell_separator$shell "

	export GIT_PS1_SHOWCOLORHINTS=true;
	__git_ps1 "$prefix" "$suffix" "[%s]"
}

PROMPT_COMMAND=__dotfiles_setup_prompt
