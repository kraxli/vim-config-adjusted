setlocal foldmethod=indent
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal expandtab
setlocal smarttab
setlocal nosmartindent
setlocal foldmethod=indent


augroup pythoncommands
  au!
  autocmd FileType python :command! IronPy
    \ :let g:parent_win =  winnr() |
    \ execute "IronRepl" |
    \ let g:last_ipy_terminal_job_id = b:terminal_job_id |
    \ execute "normal ".g:parent_win."\<c-w>w" |
    \ stopinsert
    " \ | execute("normal! \<esc>")

  autocmd FileType python :command! ReplPy :IronPy
  autocmd FileType python :command! ReplPy :IronPy
augroup END

