call plug#begin()

Plug 'christoomey/vim-tmux-navigator'
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'keith/tmux.vim'
Plug 'kien/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'w0ng/vim-hybrid'

" Ruby

" Rails, Middleman, web stuff
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }

call plug#end()

source ~/.vim/ag.vim
source ~/.vim/ctrlp.vim
source ~/.vim/hybrid.vim
source ~/.vim/nerdtree.vim
