#!/usr/bin/env zsh
# ZSH specific profile (interactive) configurations.
#
# Relevant documentation:
# - [ZSH functions](http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Other-Functions)
#
# Inspired by:
# - [StackOverflow answer with color stripping command](http://stackoverflow.com/a/10564843)

# Load the ZSH specific shell configurations
[ -f "$HOME/Developer/pfac/.files/.zshrc" ] && . "$HOME/Developer/pfac/.files/.zshrc"

# Load the generic profile configurations
[ -f "$HOME/Developer/pfac/.files/.profile" ] && . "$HOME/Developer/pfac/.files/.profile"

#
# Completion
#

# Initialize the auto-completion system.
autoload -U compinit && compinit

#
# Prompt
#

# Initialize colors arrays.
#
# See the documentation: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Other-Functions
autoload -U colors && colors

# Initialize the prompt themes modules.
#
# See the documentation: http://zsh.sourceforge.net/Doc/Release/User-Contributions.html#Other-Functions
autoload -U promptinit && promptinit

# Dynamically print the context before the prompt
precmd () {
  local left=`print -P "%{$fg_bold[white]%}%n@%M:%{$reset_color%}%F{blue}%~%f %{$fg_bold[black]%}(%l)%{$reset_color%}"`
  local leftplain=`sed -E "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g" <<< "$left"`
  local right="$(command -v git-prompt >/dev/null && git-prompt)"
  local rightwidth=$(($COLUMNS - ${#leftplain}))

  print -l '' "${left}${(l:$rightwidth:)right}"
}

# Set the prompt itself
export PROMPT="%(?,%F{green}✓ %#%f,%F{red}✗ %#%f) "

#
# Key bindings
#

# Use Ctrl+P to change to the [p]revious command
bindkey "^P" up-line-or-search

# Use Ctrl+N to change to the [n]ext command
bindkey "^N" down-line-or-search

# Use Ctrl+R to fuzzy search history (last commands first)
bindkey "^R" history-incremental-search-backward

#
# asdf-vm
#

# Enable asdf-vm completions
[ -f "$HOME/.asdf/completions/asdf.bash" ] && . "$HOME/.asdf/completions/asdf.bash"

#
# direnv
#

# Hook direnv on ZSH
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

#
# FZF
#

# Enable FZF for fuzzy file searching
[ -f "$HOME/.fzf.zsh" ] && . "$HOME/.fzf.zsh"
