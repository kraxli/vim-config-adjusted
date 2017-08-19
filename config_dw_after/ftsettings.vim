
augroup filetypeSettings
   autocmd!
   autocmd BufRead,BufNewFile,BufEnter filetype vim setlocal foldmethod=marker
	 autocmd  BufRead,BufNewFile,BufEnter *.md setlocal filetype=markdown

augroup END


augroup quickFix
   autocmd!
   autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
   autocmd BufReadPost location nnoremap <buffer> <CR> <CR>
augroup END



