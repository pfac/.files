"	show line numbers
set number
"	activate syntax highlight
syntax enable
"	set color scheme
"		see /usr/share/vim/vim73/colors
color blood
"	automatic indentation
set autoindent
set smartindent
"	indentation based on width two tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
"	autocomplete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
