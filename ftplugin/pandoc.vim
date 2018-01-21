" <!-- http://docs.mathjax.org/en/latest/configuration.html -->>

" https://github.com/jgm/pandoc/wiki/Pandoc-Tricks
" https://github.com/jgm/pandoc/wiki/How-to-add-a-%22Table-of-Contents%22-title-in-the-HTML-template
" https://github.com/jgm/pandoc/wiki/Pandoc-Extras
" https://pandoc.org/MANUAL.html

" !pandoc %:p -s -o %:p:r.html
" command! Pandoc2HTML :Pandoc  html
command!  Pandoc2HTML :NeomakeSh pandoc %:p
  \ -s
  \ -N
  \ -o %:p:r.html
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
command!  Pandoc2HTML5 :NeomakeSh pandoc %:p
  \ -s
  \ -N
  \ -o %:p:r.html
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

" !pandoc %:p -s --variable urlcolor=cyan -o %:p:r.pdf
" command!  Pandoc2Pdf :Pandoc  pdf
command!  Pandoc2Pdf :NeomakeSh pandoc %:p
  \ -s
  \ -N
  \ -o %:p:r.pdf
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


command! Pandoc2Doc :NeomakeSh pandoc %:p
  \ -s
  \ -N
  \ -o %:p:r.doc
  \ --toc
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos


command! -nargs=1 PandocLib :NeomakeSh pandoc %:p
  \ +inline_notes
  \ --filter pandoc-citeproc
  \ <f-args>
  " see:  http://johnmacfarlane.net/pandoc/demos.html


command!  Pandoc2Epub :NeomakeSh pandoc %:p
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


command! Pandoc2LatexA4 :NeomakeSh pandoc %:p
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
  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab  autoindent


augroup END



