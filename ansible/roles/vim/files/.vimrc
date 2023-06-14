" Use <Space> as leader
let mapleader = " "

" Disable Vi compatibility and make Vim a lot more useful.
set nocompatible

" Copy the indentation of the current line when starting a new one. If nothing
" is typed, the indentation is removed.
set autoindent

" Automatically read changes made to the current file when it was changed
" outside of Vim and was not changed inside of Vim (i.e. it does not overwrite
" local changes made to the file.
set autoread

" Allow <Backspace>, <Del>, Ctrl+W, and Ctrl+U, in INSERT mode.
" - `indent` allows backspacing over autoindent
" - `eol` allows backspacing over line breaks
" - `start` allows backspacing over the star of INSERT.
set backspace=eol,start,indent

" Highlight the column #80, useful to know where to wrap comments.
set colorcolumn=80

" Highlight the current line.
" set cursorline

" Use Unicode to display text.
set encoding=utf8

" Use spaces instead of tabs by default. This may be overwritten by the file
" type plugin.
set expandtab

" Use 'encoding' when writing new files, otherwise does not convert the
" encoding the file already had.
set fileencoding=""

" Only fold automatically beyond the 100th level. This will essentially
" prevent folding from happening automatically.
set foldlevel=100
"
" Enable folding (collapsing sections of code) based on the syntax.
set foldmethod=syntax

" Highlight matches when searching.
set hlsearch

" Ignore case when searching. Use `\C` in the pattern to disable it
" temporarily.
set ignorecase

" Show where the pattern will first match incrementally as it is typed.
set incsearch

" Use english for menus, regardless of what $LANG is set to.
set langmenu=none

" Always show the status line.
set laststatus=2

" Make white-space characters visible.
set list
set listchars=eol:¬,tab:⊢-,trail:·,extends:>,precedes:<,trail:·

" Turn magic on for regular expressions, which makes them work more like
" proper modern regex.
set magic

" Highlight matching brackets for 0.2s
set matchtime=2

" Enable modelines (file specific editor configs).
set modeline
set modelines=5

" Don't make a backup before overwriting a file. Git is usually enough to
" prevent any problems.
set nobackup

" No bell sound on error.
set noerrorbells

" No visual bell on error
set novisualbell

" Don't make a backup before overwriting a file. Git is usually enough to
" prevent any problems.
set nowritebackup

" Show line numbers.
set number

" Set the regular expression engine automatically. Vim will use a less
" sophisticated but faster one when the regex is more demanding.
set regexpengine=0

" Show coordinates of the cursor position.
set ruler

" Highlight matching brackets when typing.
set showmatch

" Keep 10 lines visible above and below the cursor when scrolling.
set scrolloff=10

" Use 2-space indentation by default. This can be overwritten by the file type
" plugin.
set shiftwidth=2

" Override `ignorecase` if the pattern contains upper case characters.
set smartcase

" Try to figure out the indentation for the file type.
set smartindent

" Make tabs insert the expected indentation at the end of the line.
set smarttab

" Enable spell checking. On code it only checks comments.
set spell

" If I'm using Vim, I'm probably writing in English.
set spelllang=en

" When splitting vertically, put the new window below the current one.
set splitbelow

" When splitting horizontally, put the new window on the right.
set splitright

" Use a swap file. 99% of the time this is useless when using Git, but with
" really big files not using a swap file means everything will be kept in
" memory.
set swapfile

" Use 2-space tabs by default. This may be overwritten by the file type
" plugin.
set tabstop=2

" Allow <Backspace> and <Space> to move into other lines.
set whichwrap=b,s

" Enable file type detection, plugins and indent files.
filetype plugin on
filetype indent on

" Use a nicer builtin color scheme than the default.
color slate

" Enable syntax highlight
syntax on

" Check whether the current file was changed when entering the buffer or
" coming back to Vim.
autocmd FocusGained,BufEnter * checktime

" Highlight cursor line but only in the active window.
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" Remove trailing white spaces on save.
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Toggle hybrid numbering depending on context.
"
" In the current buffer, in normal mode, use hybrid numbering. In other
" buffers, or insert mode, use absolute numbering.
"
" Source:
" - https://jeffkreeftmeijer.com/vim-number/
" - Adapted for WinEnter/WinLeave
"
augroup ToggleHybridNumbering
  autocmd!
  autocmd BufEnter,WinEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,WinLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" :W saves the file as sudo (useful for dealing with permission errors)
command! W execute 'w !sudo tee % >/dev/null' <bar> edit!

" [NORMAL|INSERT] Ctrl+S saves the file (as any normal editor)
nnoremap <C-s> :w<CR>
inoremap <C-s> <C-o>:w<CR>

" [NORMAL|INSERT] Alt+Up/Down moves the current line up/down
nnoremap <M-Down> mz:m+<cr>`z
nnoremap <M-Up> mz:m-2<cr>`z
vnoremap <M-Down> :m'>+<cr>`<my`>mzgv`yo`z
vnoremap <M-Up> :m'<-2<cr>`>my`<mzgv`yo`z

" [VISUAL] * searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>

" Plugins
call plug#begin()

" Use fzf for fuzzy search in predefined lists (files for instance)
"
" Ctrl+Shift+F  Search in all files (using ripgrep)
" Ctrl+P        Search and open file.
"
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <C-p> :Files

" Elixir
"
" Includes language support and automatic format on save.
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

let g:mix_format_on_save = 1

call plug#end()
