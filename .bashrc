#!/usr/bin/env bash
# Bash specific shell configurations
#
# Relevant documentation:
# - [Bash options](https://www.gnu.org/software/bash/manual/html_node/Variable-Index.html)

# Load the generic configurations
source "${HOME}/Developer/pfac/.files/.shrc"

#
# History
#

# Do not add to history if command is duplicate of the previous line
# or if command begins with a space
export HISTCONTROL='ignoreboth'

# Set the size of the history in memory (in number of lines)
export HISTSIZE=10000000

# Set the size of the history saved to file (in number of lines)
export HISTFILESIZE=$HISTSIZE

# Enable timestamps to be added to each command in the history file,
# and set their output format for the `history` command
export HISTTIMEFORMAT='%F %H:%M:%S'
