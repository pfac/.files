#!/usr/bin/env bash

source "${UNIXCONFDIR}/bash/text-colors";

COLORS="BLACK RED GREEN YELLOW BLUE MAGENTA CYAN WHITE"

usage () {
	echo "$0: My Shell Paint";
}

list-colors () {
	echo $COLORS;
	echo "lol"
}

is_color () {
	if [ -n "$1" ];
	then
		for color in $COLORS;
		do
			if [ "$1" == "$color" ];
			then
				return 0;
			fi;
		done;
	fi;
	return 1;
}

unknown-color () {
	echo "Unknown color name \"$1\" for \"$2\". Use -l to get a list of the known colors." >&2;
	exit 1;
}

uc () {
	echo "$1" | tr '[a-z]' '[A-Z]';
}

colorize () {
	fg_name=
	bg_name=
	bold=
	begin=
	end=

	if [ -n "$2" ]; then fg_name="TEXT_FG_${2}"; fi;
	if [ -n "$3" ]; then bg_name="TEXT_BG_${3}"; fi;
	if [ -n "$4" ]; then bold="$TEXT_BOLD"; fi;

	if [ -n "$5" ]; then begin="\["; end="\]"; fi;

	echo -e "${begin}${!fg_name}${!bg_name}${bold}${end}${1}${begin}${TEXT_RESET}${end}"
}



FOREGROUND=
BACKGROUND=
BOLD=
WRAP=


while getopts "hf:b:Blw" OPTION
do
	case "$OPTION" in
		h)
			usage;
			exit;
			;;
		f)
			name=`uc "$OPTARG"`;
			if is_color "$name";
			then
				FOREGROUND="$name";
			else
				unknown-color "$name" foreground;
			fi;
			;;
		b)
			name=`uc "$OPTARG"`;
			if is_color "$name";
			then
				BACKGROUND="$name";
			else
				unknown-color "$name" background;
			fi;
			;;
		B)
			BOLD=1;
			;;
		l)
			list-colors;
			exit;
			;;
		w)
			WRAP=1;
			;;
		\?)
			exit 1;
			;;
	esac;
done;

i=1;
for arg;
do
	if [ $i -ge $OPTIND ];
	then
		echo `colorize "$arg" "$FOREGROUND" "$BACKGROUND" "$BOLD" "$WRAP"`;
	fi;
	i=$((i+1));
done;







