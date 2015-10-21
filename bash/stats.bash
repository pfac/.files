#!/usr/bin/env bash

stats () {
	history | awk -f "${DOTFILES}/awk/stats.awk" | grep -v './' | column -c3 -s " " -t | sort -nr | head -n20
}
