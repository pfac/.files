#!/usr/bin/env sh
# Generic profile (interactive) configurations.

#
# Generic configurations
#

# Enable full-featured color terminal
export TERM='xterm-256color'

#
# System specific configurations
#
case `uname` in
  Linux)
    # Mimic macOS `open` command with `xdg-open`
    ! command -v pbcopy >/dev/null &&
      command -v xdg-open >/dev/null &&
      alias open='xdg-open'

    # Mimic macOS `pbcopy` command with `xclip`
    ! command -v pbcopy >/dev/null &&
      command -v xclip >/dev/null &&
      alias pbcopy='xclip -selection clipboard'

    # Mimic macOS `pbpaste` command with `xclip`
    ! command -v pbpaste >/dev/null &&
      command -v xclip >/dev/null &&
      alias pbpaste='xclip -selection clipboard -o'
    ;;
esac

#
# TMUX
#

# Save tmux's original path
[ "$TMUX_PATH" ] || export TMUX_PATH="$(command -v tmux)"

# Change terminal to be screen compatible
[ "$TMUX" ] && export TERM='screen-256color'

# Set a single-letter alias for tmux with the following options:
# -2: option forces tmux t assume the terminal supports 256 colors
[ "$TMUX_PATH" ] && alias t="$TMUX_PATH -2"

#
# Ripgrep
#

# Save ripgrep's original path
[ "$RIPGREP_PATH" ] || export RIPGREP_PATH="$(command -v rg)"

#
# FZF
#

# Set default command for fzf
#
# It is set to use ripgrep with the following options:
# --files: List files that would be searched but do not search
# --hidden: Include hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search
[ "$RIPGREP_PATH" ] && export FZF_DEFAULT_COMMAND="$RIPGREP_PATH --files --hidden --follow --glob '!.git/*'"

#
# Editor
#

# Save (n)vi(m)'s original path
#
# Neovim > Vim > Vi
[ "$VI_PATH" ] || export VI_PATH="$(command -v nvim || command -v vim || command -v vi)"

# Set (n)vi(m) as the default editor
[ "$VI_PATH" ] && export EDITOR="$VI_PATH"

# Set a single-letter alias for (n)vi(m)
[ "$VI_PATH" ] && alias v="$VI_PATH"

#
# Git
#

# Save git's original path
[ "$GIT_PATH" ] || export GIT_PATH="$(command -v git)"

# Set a single-letter alias for git
[ "$GIT_PATH" ] && alias g="$GIT_PATH"

# Enable git completion for the single-letter alias
command -v __git_complete >/dev/null && __git_complete g _git

#
# Ruby
#

# Set short aliases for bundle, rails and rake
command -v bundle >/dev/null &&
  alias b='bundle' &&
  alias be='bundle exec' &&
  alias r='bundle exec rails' &&
  alias rk='bundle exec rake'

#
# Erlang
#

# Enable history in Erlang VM console (like for IEx)
export ERL_AFLAGS='-kernel shell_history enabled'
