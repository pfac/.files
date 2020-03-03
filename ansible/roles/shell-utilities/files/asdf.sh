#!/bin/sh
#
# Initialize asdf-vm for tool version management.
#
# asdf-vm may be installed in a system in a number of ways. This tool tries
# to find working asdf-vm installations and source the respective initialization
# files.
#
# asdf-vm installations are searched in the following order:
# 1. User's home directory;
# 2. Third-party package managers (Homebrew);
# 3. System package managers (Pacman).
#

# Load asdf-vm from the user's home directory if available
[ -f "$HOME/.asdf/asdf.sh" ] &&
  . "$HOME/.asdf/asdf.sh" &&
  return 0

# Load asdf-vm from Homebrew if available
command -v brew >/dev/null &&
  [ "$(brew --prefix asdf 2>&1 >/dev/null)" ] &&
  [ -f "$(brew --prefix asdf 2>&1 >/dev/null)/asdf.sh" ] &&
  . "$(brew --prefix asdf 2>&1 >/dev/null)/asdf.sh" &&
  return 0

# Load asdf-vm from Pacman if available
[ -f '/opt/asdf-vm/asdf.sh' ] &&
  . '/opt/asdf-vm/asdf.sh' &&
  return 0

return 1
