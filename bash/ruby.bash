#!/usr/bin/env bash
#
# Customizations for a Ruby development friendly environment

if which bundle &> /dev/null; then
	alias b='bundle'
	alias be='bundle exec'
fi

if which rails &> /dev/null; then
	alias r='rails'
fi
