
" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" deoplete ctrl-space completion
inoremap <expr><c-space> pumvisible() ? "\<c-n>" : "\<c-x><c-o>"
" inoremap <silent><c-space> <c-x><c-o>

" Use Deoplete.
" let g:deoplete#enable_at_startup = 1

" " Let <Tab> also do completion
" inoremap <silent><expr> <Tab>
" \ pumvisible() ? "\<C-n>" :
" \ deoplete#mappings#manual_complete()

" " Close the documentation window when completion is done
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

"  The timeout (in seconds) for jedi server to workaround endless loop in jedi. Increase it if you cannot get completions for large package such as pandas. Default: 10
let g:deoplete#sources#jedi#server_timeout = 500
