
augroup filetypeSettings
   autocmd!
   autocmd BufRead,BufNewFile,BufEnter filetype vim setlocal foldmethod=marker
   " autocmd BufRead,BufNewFile,BufEnter *.md set filetype=pandoc
   " autocmd BufRead,BufNewFile,BufEnter,BufWinEnter *.wiki IndentGuidesDisable

   au FileType pandoc,markdown,text nnoremap <silent> <leader>li "='- [ ] '<cr>Pa

   " Spell checking
   au FileType tex,latex,pandoc,pdc,txt,vimwiki,wiki,md,markdown setlocal spell spelllang=en,de
	 "
   " Cursor setting
   au FileType pandoc,markdown,tex,vimwiki,txt setl conceallevel=2 concealcursor=c
   au BufNewFile,BufEnter,BufRead,BufReadPost,BufReadPre 
      \ *.pandoc,*.pdc,*.markdown,*.md,*.tex,*.vimwiki,*.wiki,*.txt, 
      \ setl conceallevel=2 concealcursor=c

   " Folding
   au FileType vimwiki,markdwon setl foldmethod=expr

   " au BufNewFile,BufEnter,BufRead,BufReadPost,BufReadPre *.vimwiki,*.wiki set filetype=markdown
" au! MyAutoCmd FileType pandoc setlocal foldmethod=expr
   " au FileType markdown setl nofoldenable

   au BufRead,BufNewFile *.m,*.oct set filetype=octave
   au BufRead,BufNewFile *.m,*.oct set syntax=matlab
   autocmd FileType matlab,octave setlocal keywordprg=info\ octave\ --vi-keys\ --index-search

augroup END


augroup quickFix
   autocmd!
   autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
   autocmd BufReadPost location nnoremap <buffer> <CR> <CR>
augroup END






