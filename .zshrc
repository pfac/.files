#!/usr/bin/env zsh
# ZSH specific shell configurations.
#
# Relevant documentation:
# - [ZSH options](http://zsh.sourceforge.net/Doc/Release/Options.html)
#
# Inspired by:
# - [Oh-My-Zsh](https://github.com/robbyrussell/oh-my-zsh/blob/05b617066ba5a37ef0c533385efd6e232a387b8f/lib/directories.zsh)

# Load the generic shell configurations.
source "$HOME/Developer/pfac/.files/.shrc"

#
# Navigation
#

# Make cd push the old directory onto the directory stack
setopt AUTO_PUSHD

# Don't push multiple copies of the same directory into the stack
setopt PUSHD_IGNORE_DUPS

# Exchange the behaviour of + and - when interacting with the directory stack
#
# By default, things like `cd +n` will target the n-th directory in the stack,
# counting from the left, and `cd -n` will do the same counting from the right.
setopt PUSHD_IGNORE_DUPS

#
# History
#

# Write the history file in the ":start:elapsed;command" format.
setopt EXTENDED_HISTORY

# Clear duplicate lines from history first (preserve unique commands longer)
setopt HIST_EXPIRE_DUPS_FIRST

# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Do not add to history if duplicate of the previous command line
setopt HIST_IGNORE_DUPS

# Don't store commands that start with spaces (I rarelly remember this is a thing)
setopt HIST_IGNORE_SPACE

# Write to history immediately, not when the shell exits, with better duration recording
setopt INC_APPEND_HISTORY_TIME

# Set the file to use for history
export HISTFILE="$HOME/.zsh_history"

# Set the size of the history in memory (in number of lines)
export HISTSIZE=10000000

# Set the size of the history saved to file (in number of lines)
export SAVEHIST="$HISTSIZE"
