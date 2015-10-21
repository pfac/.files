#!/usr/bin/env bash

PGCMD='pg_ctl -D /usr/local/var/postgres'
pg () {
	case "$1" in
		status)
			$PGCMD status
			;;
		start)
			$PGCMD start
			;;
		stop)
			$PGCMD stop
			;;
	esac
}

