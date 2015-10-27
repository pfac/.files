#!/usr/bin/env bash
#
# Customizations for a Ruby development friendly environment

__ruby_init () {
	unset -f b
	unset -f be
	unset -f r

	rbenv &> /dev/null

	if which bundle &> /dev/null; then
		alias b='bundle'
		alias be='bundle exec'
	fi

	if which rails &> /dev/null; then
		alias r='rails'
	fi

	local caller="$1"
	shift;
	"$caller" "$@"
}

b () {
	__ruby_init bundle
}

be () {
	__ruby_init bundle exec
}

r () {
	__ruby_init rails
}
