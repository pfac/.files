#!/bin/bash
#
# Git Prompt: prints the name of the current branch
#             ! if a coloring script like MyShellPaint is available, uses it to color the output:
#               * red: there conflicts which need to be solved
#               * yellow: uncommited changes
#               * green: nothing to commit

PAINT=mspaint

COLOR_OK=green;
COLOR_CHANGES=yellow;
COLOR_CONFLICTS=red;
COLOR_COMMIT=BLACK

USE_COLOR=`which mspaint`;

# either a git branch exists or no repo at all, so go home
git branch &>/dev/null || exit 1;

# set the HEAD reference
HEAD="$(git symbolic-ref HEAD 2>/dev/null)";

# extract the name of the branch from the reference
BRANCH="${HEAD##*/}";
COMMIT=`git rev-parse --short HEAD`;

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

	echo "$($PAINT -f $COLOR "${BRANCH:-unknown}") $($PAINT -f $COLOR_COMMIT -B "${COMMIT:-none}")";
else
	echo "${BRANCH:-unknown} ${COMMIT:-none}";
fi;
