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

" Line numbering
" --------------

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

" Hooks
" -> Automatically remove all trailing whitespace on save
autocmd BufWritePre <buffer> :%s/\s\+$//e

" Syntax specific
filetype plugin indent on " enable syntax specific preferences

if filereadable($HOME . '/Developer/pfac/.files/.vim/ftplugin/git.vim')
  autocmd FileType gitcommit so $HOME/Developer/pfac/.files/.vim/ftplugin/git.vim
endif

if filereadable($HOME . '/Developer/pfac/.files/.vim/ftplugin/markdown.vim')
  autocmd BufRead,BufNewFile *.md so $HOME/Developer/pfac/.files/.vim/ftplugin/markdown.vim
endif

"
" Plugins
"

" Load junegunn/vim-plug configurations, if installed and autoloaded
if filereadable($HOME . '/.vim/autoload/plug.vim') && filereadable($HOME . '/Developer/pfac/.files/.vim/plugged.vim')
  so $HOME/Developer/pfac/.files/.vim/plugged.vim
endif

" Load w0rp/ale configurations, if installed and autoloaded
if filereadable($HOME . '/.vim/plugged/ale/autoload/ale.vim') && filereadable($HOME . '/Developer/pfac/.files/.vim/plugins/ale.vim')
  so $HOME/Developer/pfac/.files/.vim/plugins/ale.vim
endif

" Load junegunn/fzf configurations, if installed and autoloaded
if filereadable($HOME . '/.vim/plugged/fzf.vim/autoload/fzf/vim.vim') && filereadable($HOME . '/Developer/pfac/.files/.vim/plugins/fzf.vim')
  so $HOME/Developer/pfac/.files/.vim/plugins/fzf.vim
endif

" Load w0ng/vim-hybrid configurations, if installed and autoloaded
if filereadable($HOME . '/.vim/plugged/vim-hybrid/colors/hybrid.vim') && filereadable($HOME . '/Developer/pfac/.files/.vim/plugins/vim-hybrid.vim')
  so $HOME/Developer/pfac/.files/.vim/plugins/vim-hybrid.vim

  colorscheme hybrid
endif

" Load scrooloose/nerdtree configurations, if installed and autoloaded
if filereadable($HOME . '/.vim/plugged/nerdtree/autoload/nerdtree.vim') && filereadable($HOME . '/Developer/pfac/.files/.vim/plugins/nerdtree.vim')
  so $HOME/Developer/pfac/.files/.vim/plugins/nerdtree.vim
endif
