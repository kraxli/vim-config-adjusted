" cite: inspired by google/yapf
   
"    imap <C-P> <c-o>:call yapf#YAPF()<cr>
 
" example:
"    map <C-P> :call yapf#YAPF()<cr>
 
"   :'<,'>YAPF  " formats lines selected in visual mode

function! dway#py#yapf(style) range
  " Determine range to format.
  let l:line_ranges = a:firstline . '-' . a:lastline
  let l:cmd = 'yapf --lines=' . l:line_ranges  . ' --style=' . a:style
 
  " Call YAPF with the current buffer
  let l:formatted_text = system(l:cmd, join(getline(1, '$'), "\n") . "\n")
 
  " Update the buffer.
  execute '1,' . string(line('$')) . 'delete'
  call setline(1, split(l:formatted_text, "\n"))
 
  " Reset cursor to first line of the formatted range.
  call cursor(a:firstline, 1)
endfunction
 
command! -range=% YAPF <line1>,<line2>call yapf#YAPF()
