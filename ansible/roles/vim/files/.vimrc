" Leader
let mapleader = " "

" Global
set autoindent      " enable automatic indentation
set backspace=2     " make backspace work like in modern editors
set backupcopy=yes  " make sure the file is overwritten on save
set background=dark " use dark background for color schemes
set colorcolumn=80  " show the 80 column mark with a different color
set expandtab       " expand tabs into spaces
set foldmethod=syntax " enable folding, to be able to collapse blocks of code
set foldlevel=10
set hlsearch        " highlight search results
set linebreak       " break line if a wrapping column is set
set listchars=eol:¬,tab:⊢-,trail:·,extends:>,precedes:<,trail:·
set list            " make white-space characters visible
set modeline        " enable modelines (file specific editor settings)
set modelines=5     " set the number of lines to search for modelines (from the
                    " top)
set mouse=a         " enable mouse
set nocompatible    " remove Vi compatibility mode
set ruler           " show cursor position
set shiftwidth=2    " set indentation width (in spaces)
set smartindent     " smarter automatic indentation
set splitbelow      " when opening horizontal splits, place the cursor below
set splitright      " when opening vertical splits, place the cursor on the
                    " right
set tabstop=2       " set tab width (in spaces)
set wrap            " enable line wrapping

"
" Line numbering
"

" Enable line numbering
set number

" Toggle hybrid numbering depending on context.
"
" On the current buffer, in normal mode, use hybrid numbering.
"
" On other buffers, or insert mode, use absolute numbering.
"
" Source:
" - https://jeffkreeftmeijer.com/vim-number/
" - Adapted for WinEnter/WinLeave
"
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,WinEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,WinLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

"
" Color
"

" Enable syntax highlight
syntax enable

" Set color default scheme (ships with standard Vim)
color desert

" Set custom color scheme (depends on plugin)
silent! color pfac-hybrid

"
" Key bindings
"

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

"
" Hooks
"

" -> Automatically remove all trailing whitespace on save
autocmd BufWritePre <buffer> :%s/\s\+$//e

"
" Filetype plugins
"

" enable syntax specific preferences
filetype plugin indent on

"""
"""
"""   PLUGINS
"""
"""

call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'keith/tmux.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'
Plug 'w0rp/ale'

" Elixir
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'slashmili/alchemist.vim', { 'for': ['elixir', 'eelixir'] }

" Rails, Middleman, web stuff
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

" Rust
Plug 'rust-lang/rust.vim'

" TOML
Plug 'cespare/vim-toml'

call plug#end()

"""
"""
"""   POST PLUGINS
"""
"""

" Set custom colorscheme
color pfac-hybrid
