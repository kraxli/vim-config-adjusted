" setlocal foldmethod=indent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=99
setlocal expandtab
setlocal smarttab
setlocal nosmartindent
" setlocal foldmethod=indent
" set colorcolumn=+1 " highlight column after textwidth
set colorcolumn=


" ============ IRON.NVIM ============
" https://github.com/Vigemus/iron.nvim/issues/94
" https://github.com/Vigemus/iron.nvim/issues/96
" and README
lua <<EOF
require("iron").core.set_config{
  preferred = { python = "ipython"},
  repl_open_cmd = 'vertical 55 split'
}

EOF

" see: /home/dave/.cache/vim/dein/repos/github.com/Vigemus/iron.nvim/plugin/iron.vim
" lines 32f and 53f 
" other possible key combi: ex
nmap <m-a> 0<Plug>(iron-send-motion)
vmap <m-a> <Plug>(iron-send-motion)

nmap <m-e> 0<Plug>(iron-send-motion)
vmap <m-e> <Plug>(iron-send-motion)

nmap <c-e> 0<Plug>(iron-send-motion)
vmap <c-e> <Plug>(iron-send-motion)

nmap <c-l> 0<Plug>(iron-send-motion)<right>

" function! SendLine()
"   let column = col('.')
"   " execute "normal 0"
"   execute "normal <m-a-left>"
"   execute "normal ".column."|"
" endfunction
" nmap <c-e> :call SendLine()<cr>

" ========== IRON.NVIM - end =========



" augroup pythoncommands
"   au!
  autocmd FileType python :command! IronPy
    \ :let g:parent_win =  winnr() |
    \ execute "IronRepl" |
    \ let g:last_ipy_terminal_job_id = b:terminal_job_id |
    \ execute "normal ".g:parent_win."\<c-w>w" |
    \ stopinsert
    " \ | execute("normal! \<esc>")

  autocmd FileType python :command! ReplPy :IronPy
  autocmd FileType python :command! ReplPy :IronPy

  au FileType python command! Run3 :!python3 %
  au FileType python command! Run2 :!python2 %
  au FileType python command! Run :Run3
  au FileType python command! Unittest :!dmd -unittest %
  au FileType python map <F5> :Run<cr>

" augroup END

