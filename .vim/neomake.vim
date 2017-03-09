" Run all makers for the current buffer filetype when I enter the buffer or
" save it.
autocmd! BufWinEnter,BufWritePost * Neomake

" Close the Neomake list window when I close the buffer.
autocmd! BufWinLeave * :lclose

"let g:neomake_open_list = 2

" Debugging
let g:neomake_verbose = 3
let g:neomake_logfile = '/tmp/neomake.log'
