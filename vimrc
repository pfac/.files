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
color slate
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
" enable modelines
set modelines=5
" filetype detection
filetype on
filetype indent on
filetype plugin on
"	auto wrap commit messages (Git)
au FileType ruby source ~/.vim/ftplugin/ruby.vim
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

" Enable mouse (let's face it, it's faster when moving to the middle of nowhere)
set mouse=a

if filereadable($UNIXCONFDIR."/vimrc-vundle")
	so $UNIXCONFDIR/vimrc-vundle
endif
