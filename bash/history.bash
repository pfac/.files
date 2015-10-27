#!/usr/bin/env bash
#
# Customizations for Bash History command
#

# Add timestamp to command on output
# (useful to match with logs)
export HISTTIMEFORMAT="%h %d %H:%M:%S> "

# Ignore duplicate commands in a row
export HISTCONTROL=ignoredups

# Increase number of lines in history
export HISTSIZE=10000
