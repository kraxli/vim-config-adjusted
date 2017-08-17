
augroup filetypeSettings
   autocmd!
   autocmd BufRead,BufNewFile,BufEnter filetype vim setlocal foldmethod=marker

augroup END


augroup quickFix
   autocmd!
   autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
   autocmd BufReadPost location nnoremap <buffer> <CR> <CR>
augroup END



