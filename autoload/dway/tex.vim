

function! kraxli#tex#BibTex()
  :!pdflatex %:p
  :!bibtex %:r
  :!pdflatex %:p
  :!pdflatex %:p
endfunction
 
