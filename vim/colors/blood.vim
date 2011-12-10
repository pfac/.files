" blood.vim
" Color scheme for the vim editor, based on black and red.
" Author:	Pedro Costa
" Version:	1.0
" Date:		9th November 2011

"	Set background as dark themed
set background=dark
"	Reset the highlight colors
hi clear
"	Reset the syntax highlight
if exists("syntax_on")
	syntax reset
endif

"	Name the scheme
let g:colors_name = "blood"

" Highlight rules go as follow:
" hi <group-name> [<term>] [<cterm>] [<ctermbg>] [<ctermfg>] [<gui>] [<guibg>] [<guifg>]
" where
"	<group-name>
"		Defines where the highlight rule will be applied.
"		For more info ':h group-name'.
"		Other group-names can be found in pre-made color schemes and specific syntax files.
"	<term>,<cterm>,<gui>
"		Attributes lists, which define how the text will be formatted.
"	<ctermbg>,<guibg>
"		Define the color for the background
"	<ctermfg>,<guifg>
"		Define the font color.
"and
"	<term> applies to no-color terminals
"	<cterm*> applies to color terminals (Terminal.app)
"	<gui*> applies to the vim visual interface (MacVim.app)

" Rules

"	Normal (defines the global aspect)
hi Normal term=none cterm=none ctermbg=black ctermfg=white gui=none guibg=black guifg=white
"	Line numbers
hi LineNr term=none cterm=none ctermfg=darkgrey gui=none guifg=darkgrey

"	Comment
hi Comment term=italic cterm=italic ctermfg=grey gui=italic guifg=grey

"	Constant
hi Constant term=none cterm=none ctermfg=darkred gui=none guifg=darkred
"		string
hi String term=none cterm=none ctermfg=darkred gui=italic guifg=darkred

"	Identifier
hi Identifier term=none cterm=none ctermfg=yellow gui=none guifg=yellow

"	Statement
hi Statement term=none cterm=none ctermfg=brown gui=none guifg=brown

"	Keyword
hi Keyword term=none cterm=none ctermfg=brown gui=none guifg=brown

"	Generic Preprocessor
hi PreProc term=none cterm=none ctermfg=grey gui=none guifg=grey

"	Type
hi Type term=none cterm=none ctermfg=red gui=none guifg=red

"	Special
hi Special term=none cterm=none ctermfg=yellow gui=none guifg=yellow


