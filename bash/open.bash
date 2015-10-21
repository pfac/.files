#!/usr/bin/env open
#
# open -

open () {
	case `uname` in
	Darwin)
		/usr/bin/open "$@";
		;;
	*)
		xdg-open "$@";
		;;
	esac
}
