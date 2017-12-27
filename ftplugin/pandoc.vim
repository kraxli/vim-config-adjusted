" <!-- http://docs.mathjax.org/en/latest/configuration.html -->>

" https://github.com/jgm/pandoc/wiki/Pandoc-Tricks
" https://github.com/jgm/pandoc/wiki/How-to-add-a-%22Table-of-Contents%22-title-in-the-HTML-template
" https://github.com/jgm/pandoc/wiki/Pandoc-Extras
" https://pandoc.org/MANUAL.html

" !pandoc %:p -s -o %:p:r.html 
command! Pandoc2HTML :Pandoc  html
  \ -s
  \ --mathjax='http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML'
  \ --include-in-header='~/.config/nvim/templates/pandoc_html.pdc'
  \ -N
  \ --toc
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  " \ -V toc-title:"Table of Contents"


command!  Pandoc2Pdf :Pandoc  pdf
  \ -s
  \ -N
  \ --toc
  \ --latex-engine=xelatex
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  \ --number-sections
  \ --variable=geometry:a4paper,linkcolor:blue


" command! Pandoc2Doc :NeomakeSh pandoc docx
command! Pandoc2Doc :Pandoc docx
  \ -s
  \ -N
  \ --toc
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos


command! -nargs=1 PandocLib :Pandoc
  \ +inline_notes
  \ --filter pandoc-citeproc
  \ <f-args>
  " see:  http://johnmacfarlane.net/pandoc/demos.html


command!  Pandoc2Epub :Pandoc  epub
  \ -s
  \ -N
  \ --toc
  \ --latex-engine=xelatex
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos
  \ --number-sections
  \ --variable=linkcolor:blue


command! Pandoc2LatexA4 :Pandoc latex
  \ -s
  \ -N
  \ --toc
  \ --latex-engine=xelatex
  \ --variable=geometry:a4paper
  \ --filter pandoc-eqnos
  \ --filter pandoc-tablenos
  \ --filter pandoc-fignos



augroup PandocGroup
  autocmd!

  " hf is more in line with hb
  nmap <localleader>hf <localleader>hn
  " same command for .tex files in tex.vim
  nmap <leader>op :!evince %:p:r.pdf & <cr><cr>
  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab  autoindent


augroup END



