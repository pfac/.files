"	remove Vi compatibility mode
set nocompatible 
"	show line numbers
set number
"	show cursor position
set ruler
"	activate syntax highlight
syntax enable
"	set color scheme
"		see /usr/share/vim/vim73/colors
color blood
"	automatic indentation
set autoindent
set smartindent
"	indentation based on width four tabs
set tabstop=4
set shiftwidth=4
set noexpandtab
"	line wrapping
set wrap
set linebreak
"	highlight search results
set hlsearch
"	auto format comments
set formatoptions=c,q,r,t
"	auto wrap commit messages (Git)
au FileType gitcommit set tw=72
""	autocomplete
"autocmd FileType css set omnifunc=csscomplete#CompleteCSS

"	Shortcuts
""	Navigation
"""	move through wrapped lines too
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk
