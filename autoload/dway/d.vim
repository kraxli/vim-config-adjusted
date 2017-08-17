

function! kraxli#d#Refactor(newName)
  let wordUnderCursor = expand("<cword>")
  %s/\<wordUnderCursor\>/a:newName/g
endfunction
 
