#!/bin/bash

COLOR_OK=green;
COLOR_CHANGES=yellow;
COLOR_CONFLICTS=red;

USE_COLOR=`which mspaint`;

# either a git branch exists or no repo at all, so go home
git branch &>/dev/null || exit 1;

# set the HEAD reference
HEAD="$(git symbolic-ref HEAD 2>/dev/null)";

# extract the name of the branch from the reference
BRANCH="${HEAD##*/}";

if [ "$USE_COLOR" ];
then
	if [ `git diff --name-only --diff-filter=U` ];
	then
		# that condition should return the list of conflicts
		COLOR="$COLOR_CONFLICTS";
	else
		if [ "$(git status | grep -F 'working directory clean')" ];
		then
			COLOR="$COLOR_OK";
		else
			COLOR="$COLOR_CHANGES";
		fi;
	fi;

	mspaint -f $COLOR "${BRANCH:-unknown}";
else
	echo "${BRANCH:-unknown}";
fi;
