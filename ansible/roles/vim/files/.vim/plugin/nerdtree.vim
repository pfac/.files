" open NERDTree and focus the other buffer
function g:PfacNERDTreeOpenAndBlur()
  NERDTree
  wincmd w
endfunction

" open if not editing a file
function g:PfacNERDTreeOpenIfNoFile()
  if argc() == 0 && !exists('s:std_in')
    :call g:PfacNERDTreeOpenAndBlur()
  endif
endfunction

" close vim if the only window left is NERDTree
function g:PfacNERDTreeAutoClose()
  if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree())
    quit
  endif
endfunction

augroup nerdtree_shortcuts
  " open automatically when vim starts
  autocmd VimEnter * :call g:PfacNERDTreeOpenAndBlur()

  " even if not editing a file
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * :call g:PfacNERDTreeOpenIfNoFile()

  " close automatically if NERDTree is the last open buffer
  autocmd bufenter * :call g:PfacNERDTreeAutoClose()

  " shortcut to toggle NERDTree
  " (similar to Atom and Sublime)
  map <C-k><C-b> :NERDTreeToggle<CR>
augroup END