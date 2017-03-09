call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-lang/vim-elixir', { 'for': ['elixir', 'eelixir'] }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'keith/tmux.vim'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'

" Ruby

" Rails, Middleman, web stuff
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

source ~/.vim/fzf.vim
source ~/.vim/hybrid.vim
source ~/.vim/neomake.vim
source ~/.vim/nerdtree.vim
