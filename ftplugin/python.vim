setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal expandtab
setlocal smarttab
setlocal nosmartindent
setlocal foldmethod=indent

let g:py_style_pep8 = "'{based_on_style: pep8, spaces_before_comment: 4, split_before_logical_operator: true, indent_width: 4}'"
command!  -range=%  Yapf <line1>,<line2>call dway#py#yapf(g:py_style_pep8)
" map <C-Y> :call yapf#YAPF()<cr>
" imap <C-Y> <c-o>:call yapf#YAPF()<cr>


function! DelBreakPoints()
    :g/\.set_trace()/d
endfunction


function! ClearBpsFct()
    :call DelBreakPoints()
    :w!
endfunction


" function! InclBreakPoint()
"     " let i_numargs = a:0

"     let bp_line = "."

"     " if int(i_numargs) != 0
"     "   let bp_line = a:1
"     "   " this could be extended to be a list and then looping over the list to include bp at all lines in the list
"     " endif

"     append(line(bp_line)-1, "import ipdb; ipdb.set_trace()")

" endfunction
" map <leader>bp :call  InclBreakPoint()<cr>


autocmd! BufNewFile,BufRead *.py,*.python :command! -nargs=1 InclBp  :call InclBreakPoint(<f-args>)<cr>
command! ClearBps :call ClearBpsFct()<cr>


map <silent> <leader>bp Oimport ipdb; ipdb.set_trace()<esc>
map <silent> <leader>Bp oimport ipdb; ipdb.set_trace()<esc>

nnoremap <leader>bd :call DelBreakPoints()

" the follwoing errorformat works for AsyncRun python %:p
setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]
command! PyRun AsyncRun python3 %:p
" setlocal efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m




