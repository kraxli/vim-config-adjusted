

   " == tex/ latex/ pdc == 
        
augroup TexPandoc
      autocmd!
      autocmd BufNewFile,BufRead *.tex,*.pdc nnoremap <leader>op :!evince %:p:r.pdf & <cr><cr>
      " autocmd BufNewFile,BufRead *.tex nnoremap <leader>op :!FoxitReader %:r.pdf <cr>
      " autocmd BufNewFile,BufRead *.tex nnoremap <leader>op :!start  "C:\Prgm\Foxit Reader\Foxit Reader.exe" %:r.pdf <cr>

      autocmd! BufNewFile,BufRead *.tex nnoremap <S-F12> :call BibTex() <cr>

      " autocmd! BufNewFile,BufRead *.tex nnoremap <F12> :!pdflatex %:p -output-directory=%:h<cr>
      autocmd! BufNewFile,BufRead *.tex nnoremap <F12> :!xelatex %:p -output-directory=%:p:h<cr>
    " augroup END 



   autocmd BufNewFile,BufRead *.pdc,*.md :command! -nargs=1 PandocLib :Pandoc +inline_notes --filter pandoc-citeproc <f-args>
   " see:  http://johnmacfarlane.net/pandoc/demos.html
   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2HTML :Pandoc  html -s --mathjax -N --toc --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2Doc :Pandoc  docx -s -N --toc --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2PdfA4 :Pandoc pdf -s -N --toc --latex-engine=xelatex --variable=geometry:a4paper --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos

   autocmd BufNewFile,BufRead *.md,*.pdc :command!  Pandoc2Pdf :Pandoc  pdf -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos --number-sections  --variable=linkcolor:blue

   autocmd BufNewFile,BufRead *.md,*.pdc :command!  Pandoc2Epub :Pandoc  epub -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos --number-sections  --variable=linkcolor:blue

   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2LatexA4 :Pandoc latex -s -N --toc --latex-engine=xelatex --variable=geometry:a4paper --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2Latex :Pandoc latex -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos


   autocmd BufNewFile,BufRead *.md,*.pdc set tabstop=2 softtabstop=2 shiftwidth=2 expandtab  autoindent
 
augroup END

command! PandocEx :tabnew /home/dave/Dropbox/Work_Content/SCOR/VIM/pandoc_example.pdc
