#!/usr/bin/env python
#
# MSPAINT: My Shell PAINT
#

from optparse import OptionParser
from sys import stdout as out

import pdb

FORMAT = '\033[%dm'
RESET = FORMAT % 0
COLORS = {
	'black' : 0,
	'red' : 1,
	'green' : 2,
	'yellow' : 3,
	'blue' : 4,
	'magenta' : 5,
	'cyan' : 6,
	'white' : 7
}


def get_color_code (color, base):
	return COLORS[color] + base;

def get_fg_color_code (color):
	return get_color_code(color, 30)

def get_bg_color_code (color):
	return get_color_code(color, 40)

def get_color (color_code):
	return FORMAT % color_code

def colorize (string, fg='', bg='', bold=False):
	fg_str = get_color( get_fg_color_code(fg) ) if fg else ''
	bg_str = get_color( get_bg_color_code(bg) ) if bg else ''
	bold_str = FORMAT % 1 if bold else ''
	return "%s%s%s%s%s" % (fg_str, bg_str, bold_str, string, RESET)


def list_colors ():
	for key in COLORS.keys():
		normal = colorize(key, fg=key)
		bold = colorize('bold', fg=key, bold=True)
		print "%s %s" % (normal, bold)

def callback_for_list (option, opt, value, parser) :
	list_colors()

def main () :
	usage = 'usage: %prog [options] args'
	version = 'My Shell Paint v1.0'
	parser = OptionParser(usage = usage, version = version)
	parser.add_option( '-b', '--background',
		dest = 'bg',
		type = 'choice',
		choices = COLORS.keys(),
		help = "set the background color"
		)
	parser.add_option( '-f', '--foreground',
		dest = 'fg',
		type = 'choice',
		choices = COLORS.keys(),
		help = "set the foreground color."
		)
	parser.add_option( '-B', '--bold',
		dest = 'bold',
		action = 'store_true',
		help = "use bold"
		)
	parser.add_option( '-l', '--list',
		action = 'callback',
		callback = callback_for_list
		)
	opts, argv = parser.parse_args()

	bg = opts.bg if opts.bg else ''
	fg = opts.fg if opts.fg else ''
	bold = opts.bold

	while argv :
		print colorize( argv.pop(0), fg=fg, bg=bg, bold=bold )

if __name__ == "__main__" :
	main()
