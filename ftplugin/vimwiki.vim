
 au! BufRead,BufNewFile *.wiki set filetype=vimwiki
 au! FileType vimwiki setlocal spell spelllang=en,de
 au! FileType vimwiki setlocal foldlevel=0

command! Tasks :e ~/Dropbox/tasks/Tasks.wiki
command! ToDo :e ~/Dropbox/PKD/vimwiki/ToDo.wiki
command! Vimwiki2Markdown :silent call Vimwiki2Markdown()<cr>

function! Vimwiki2Markdown()
	execute 'silent %s/ =\+//g'
	execute 'silent %s/^= \([a-zA-ZöüäÖÜÄ:0-9 /-]\)/# \1'
	execute 'silent %s/^== \([a-zA-ZöüäÖÜÄ:0-9 /-]\)/## \1'
	execute 'silent %s/^=== \([a-zA-ZöüäÖÜÄ:0-9 /-]\)/### \1'
	execute 'silent %s/^==== \([a-zA-ZöüäÖÜÄ:0-9 /-]\)/#### \1'
endfunction


" <!-- http://docs.mathjax.org/en/latest/configuration.html -->>

" https://github.com/jgm/pandoc/wiki/Pandoc-Tricks
" https://github.com/jgm/pandoc/wiki/How-to-add-a-%22Table-of-Contents%22-title-in-the-HTML-template
" https://github.com/jgm/pandoc/wiki/Pandoc-Extras
" https://pandoc.org/MANUAL.html

" !pandoc %:p -s -o %:p:r.html
" command! Pandoc2HTML :Pandoc  html
command!  Pandoc2HTML :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:h/html/%:p:t:r.html
  \ --toc
  \ --mathjax='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
  \ --variable linkcolor=blue
  \ --variable citecolor=blue
  \ --variable urlcolor=blue
  \ --variable toccolor=blue
  \ --number-sections
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  " \ --include-in-header='~/.config/nvim/templates/pandoc_html.pdc'
  " \ -V toc-title:"Table of Contents"

" cd ~/pandoc-bootstrap-template/
" pandoc ~/Dropbox/PKD/interviews.md -o interviews.html -f markdown --template template.html --css template.css --self-contained --toc --toc-depth=2
" cd ~/pandoc-bootstrap-adaptive-template/ 
" pandoc ~/Dropbox/PKD/interviews.md -o interviews.html -f markdown --template standalone.html --css template.css --toc --toc-depth=2

" source: https://github.com/tonyblundell/pandoc-bootstrap-template
command!  Pandoc2HTMLBS :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:h/html/%:p:t:r.html
  \ --toc
  \ --toc-depth=2
  \ --mathjax='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
  \ --css ~/pandoc-bootstrap-template/template.css
  \ --template ~/pandoc-bootstrap-template/template.html
  " \ --template ~/pandoc-bootstrap-template/standalone.html
  " \ --variable linkcolor=blue
  " \ --variable citecolor=blue
  " \ --variable urlcolor=blue
  " \ --variable toccolor=blue
  " \ --number-sections
  " \ --filter pandoc-eqnos
  " \ --filter pandoc-tablenos
  " \ --filter pandoc-fignos

command!  Pandoc2HTMLkiller :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:h/html/%:p:t:r.html
  \ --toc
  \ --toc-depth=2
  \ --mathjax='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
  \ --css ~/.config/nvim/templates/pandoc_killercup.css
  \ -M date="`date "+%B %e, %Y"`"


" !pandoc %:p -s --variable urlcolor=cyan -o %:p:r.pdf
" command!  Pandoc2Pdf :Pandoc  pdf
command!  Pandoc2Pdf :AsyncRun pandoc %:p
  \ -s
  \ -N
  \ -o %:p:h/pdf/%:p:t:r.pdf
  \ --toc
  \ --latex-engine=xelatex
  \ --variable geometry=a4paper
  \ --variable linkcolor=blue
  \ --variable citecolor=blue
  \ --variable urlcolor=blue
  \ --number-sections
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  " \ --variable toccolor=blue

command! Pandoc2Md :!pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:r.md
  \ --toc
  \ --variable geometry=a4paper
  \ --variable linkcolor=blue
  \ --variable citecolor=blue
  \ --variable urlcolor=blue
  \ --number-sections
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  " \ --variable toccolor=blue


command! Pandoc2Doc :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:h/docs/%:p:t:r.docx
  \ --toc
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  " \ -o %:p:t:r.doc


command! -nargs=1 PandocLib :AsyncRun pandoc %:p
  \ +inline_notes
  \ --filter pandoc-citeproc
  \ <f-args>
  " see:  http://johnmacfarlane.net/pandoc/demos.html


command!  Pandoc2Epub :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:r.epub
  \ --toc
  \ --latex-engine=xelatex
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  \ --number-sections
  \ --variable=linkcolor:blue


command! Pandoc2LatexA4 :AsyncRun pandoc %:p
  \ -f markdown
  \ -s
  \ -N
  \ -o %:p:r.latex
  \ --toc
  \ --latex-engine=xelatex
  \ --variable=geometry:a4paper
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos

" command! PandocPublish :Pandoc2HTML <bar> :Pandoc2Pdf
" command! PandocPublish :execute "Pandoc2HTML\|Pandoc2Pdf"
function! PandocPublish()
     :Pandoc2HTML
     :Pandoc2Pdf
endfunction
command! PandocPublish :call PandocPublish()

augroup PandocGroup
  autocmd!

  " hf is more in line with hb
  nmap <localleader>hf <localleader>hn
  " same command for .tex files in tex.vim
  nmap <leader>op :!evince %:p:r.pdf & <cr><cr>
  set expandtab  autoindent

augroup END

