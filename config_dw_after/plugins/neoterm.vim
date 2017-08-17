
let g:neoterm_position = 'vertical left' "'horizontal'
let g:neoterm_automap_keys = ',tt'

nnoremap <silent> f<F5> :TREPLSendFile<cr>
nnoremap <silent> <F5> :TREPLSendLine<cr>
vnoremap <silent> <F5> :TREPLSendSelection<cr>

" Useful maps
" hide/close terminal
nnoremap <silent> ,nth :call neoterm#close()<cr>
" clear terminal
nnoremap <silent> ,ntl :call neoterm#clear()<cr>

" kills the current job (send a <c-c>)
nnoremap <silent> ,ntc :call neoterm#kill()<cr>

" Rails commands
command! Troutes :T rake routes
command! -nargs=+ Troute :T rake routes | grep <args>
command! Tmigrate :T rake db:migrate

" Git commands
command! -nargs=+ Tg :T git <args>  


" :T <command>: Opens a terminal, or use an opened terminal, and runs the given command within a terminal.
" :Tmap <command>: maps a the given command to ,tt.

" vim:filetype=vim:foldmethod=marker   
