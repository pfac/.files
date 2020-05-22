let g:ale_fix_on_save = 1
let g:ale_fixers = {
      \   'javascript': ['prettier', 'eslint'],
      \   'javascriptreact': ['prettier', 'eslint'],
      \   'ruby': ['rubocop'],
      \   'scss': ['prettier', 'stylelint'],
      \}

let g:ale_javascript_prettier_use_local_config = 1
