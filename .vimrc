" Leader
let mapleader = " "

" Global
set autoindent      " enable automatic indentation
set backspace=2     " make backspace work like in modern editors
set backupcopy=yes  " make sure the file is overwritten on save
set background=dark " use dark background for color schemes
set colorcolumn=80  " show the 80 column mark with a different color
set expandtab       " expand tabs into spaces
set hlsearch        " highlight search results
set linebreak       " break line if a wrapping column is set
set listchars=eol:¬,tab:⊢-,trail:·,extends:>,precedes:<,trail:·
set list            " make white-space characters visible
set modeline        " enable modelines (file specific editor settings)
set modelines=5     " set the number of lines to search for modelines (from the
                    " top)
set mouse=a         " enable mouse
set nocompatible    " remove Vi compatibility mode
set number          " show line numbers
set ruler           " show cursor position
set shiftwidth=2    " set indentation width (in spaces)
set smartindent     " smarter automatic indentation
set splitbelow      " when opening horizontal splits, place the cursor below
set splitright      " when opening vertical splits, place the cursor on the
                    " right
set tabstop=2       " set tab width (in spaces)
set wrap            " enable line wrapping

" Color
syntax enable       " enable syntax highlight
color desert        " set color default scheme
                    " see /usr/share/vim/vim*/colors for available schemes

" Key bindings
"   LeftArrow: go left, considering wrapping
nnoremap <Left> gh
"   DownArrow: go down, considering wrapping
nnoremap <Down> gj
"   UpArrow: go up, considering wrapping
nnoremap <Up> gk
"   RightArrow: go right, considering wrapping
nnoremap <Right> gl
"   Ctrl-H: go to window on the left
nnoremap <C-h> <C-w><C-h>
"   Ctrl-J: go to window below
nnoremap <C-j> <C-w><C-j>
"   Ctrl-K: go to window above
nnoremap <C-k> <C-w><C-k>
"   Ctrl-L: go to window on the right
nnoremap <C-l> <C-w><C-l>

" Syntax specific
filetype plugin indent on " enable syntax specific preferences
autocmd FileType gitcommit source ~/.vim/ftplugin/git.vim
autocmd BufRead,BufNewFile *.md source ~/.vim/ftplugin/markdown.vim

" Plugin manager
source ~/.vim/plugins.vim
