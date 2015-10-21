#!/usr/bin/env bash

# Executable searching PATH
# - current directory
# - 'bin' under current directory
# - 'local/bin' under user home
# - 'bin' under .files
# - '/usr/local/bin' for installed packages
# - default path
export PATH=".:./bin:${HOME}/local/bin:${DOTFILES}/bin:/usr/local/bin:${PATH}";

# Library searching LD_LIBRARY_PATH
# - 'local/lib' under user home
# - default path, if any
LIBS="${HOME}/local/lib";

if [ "$LD_LIBRARY_PATH" ]; then
	export LD_LIBRARY_PATH="${LIBS}:${LD_LIBRARY_PATH}";
else
	export LD_LIBRARY_PATH="${LIBS}";
fi;
