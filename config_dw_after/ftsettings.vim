
augroup filetypeSettings
   autocmd!
   autocmd BufRead,BufNewFile,BufEnter filetype vim setlocal foldmethod=marker
   autocmd BufRead,BufNewFile,BufEnter *.md set filetype=pandoc
   " autocmd BufRead,BufNewFile,BufEnter,BufWinEnter *.wiki IndentGuidesDisable

" Spell checking
	 au FileType tex,latex,pandoc,pdc,txt,vimwiki,wiki,md,markdown setlocal spell spelllang=en,de
	 "
" Cursor setting
au FileType pandoc,markdown,tex,vimwiki,txt setl conceallevel=2 concealcursor=nv

augroup END


augroup quickFix
   autocmd!
   autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
   autocmd BufReadPost location nnoremap <buffer> <CR> <CR>
augroup END






