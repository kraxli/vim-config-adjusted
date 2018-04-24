
" function! <SID>AutoProjectRootCD()
"   try
"     if &ft != 'help'
"       " ProjectRootCD
"       " ProjectRootLCD
"       let root = projectroot#get(a:0 ? a:1 : '')
"       if len(root)
"        " ProjectRootLCD
"         let cdcmd = get(a:000, 1, 'cd')
"         exe cdcmd fnameescape(root)
"       endif
"     endif
"   catch
"     " Silently ignore invalid buffers
"   endtry
" endfunction

" autocmd BufEnter * call <SID>AutoProjectRootCD()

autocmd! BufEnter,BufRead * call dway#base#AutoProjectRootLCD()

