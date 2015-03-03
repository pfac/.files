#!/usr/bin/env sh

NEST_ST3_CONF_DIR="${UNIXCONFDIR}/editors/sublime-text-3";

# Configure for Mac OS X
if [ `uname` == 'Darwin' ]; then
	USER_ST3_CONF_DIR="${HOME}/Library/Application Support/Sublime Text 3/Packages/User";
fi;

# Prepare
if [ ! -d "$USER_ST3_CONF_DIR" ]; then
	mkdir -p "$USER_ST3_CONF_DIR";
fi;

# Install
for file in `/bin/ls "$NEST_ST3_CONF_DIR" | egrep -v 'install\.sh$'`; do
	ln -s "${NEST_ST3_CONF_DIR}/${file}" "${USER_ST3_CONF_DIR}/${file}";
done;
