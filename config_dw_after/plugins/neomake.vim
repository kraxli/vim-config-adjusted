
" errorformat: http://vim.wikia.com/wiki/Errorformats
" example: set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
" let &efm = '%E%f:%l:%c\,%n: %m,%Z%m' " '%E%f:%l: %m'

function! PostprocessXelatexMaker(entry)
      " echo a:entry
      execute "!echo ".str(a:entry)." >>  /home/dave/temp/vimlog.log"
      if a:entry.text =~? '^\|\|'
        execute 'join!'
      endif
endfunction


let g:neomake_tex_xelatex_maker = {
        \ 'exe': 'xelatex',
        \ 'args': ['-file-line-error', '-8bit', '-interaction', 'nonstopmode'],
        \ 'errorformat': '%E%f:%l: %m'
    \ }
        " \ 'postprocess': function('PostprocessXelatexMaker')



let g:neomake_d_dscanner_maker = {
    \ 'exe': 'dscanner',
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)'
    \ }


let g:neomake_pdc_pdcHtml_maker = {
    \ 'exe': 'pandoc',
    \ 'args':  ['html', '-s', '--mathjax', 'http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML',
    \           '-N', '--toc', '--filter', 'pandoc-eqnos', '--filter', 'pandoc-tablenos', '--filter', 'pandoc-fignos']
    \ }


"    autocmd BufNewFile,BufRead *.pdc,*.md :command! -nargs=1 PandocLib :Pandoc +inline_notes --filter pandoc-citeproc <f-args>
"    " see:  http://johnmacfarlane.net/pandoc/demos.html
   autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2HTML :Pandoc  html -s --mathjax -N --toc --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
"    autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2Doc :Pandoc  docx -s -N --toc --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
"    autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2PdfA4 :Pandoc pdf -s -N --toc --latex-engine=xelatex --variable=geometry:a4paper --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos

"    autocmd BufNewFile,BufRead *.md,*.pdc :command!  Pandoc2Pdf :Pandoc  pdf -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos --number-sections  --variable=linkcolor:blue

"    autocmd BufNewFile,BufRead *.md,*.pdc :command!  Pandoc2Epub :Pandoc  epub -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos --number-sections  --variable=linkcolor:blue

"    autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2LatexA4 :Pandoc latex -s -N --toc --latex-engine=xelatex --variable=geometry:a4paper --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos
"    autocmd BufNewFile,BufRead *.md,*.pdc :command! Pandoc2Latex :Pandoc latex -s -N --toc --latex-engine=xelatex --filter pandoc-eqnos --filter pandoc-tablenos --filter pandoc-fignos

"    autocmd BufNewFile,BufRead *.md,*.pdc :command! PandocEx :tabnew U:\_Software\Pandoc\pandoc_example.pdc
"    autocmd BufNewFile,BufRead *.md,*.pdc set tabstop=2 softtabstop=2 shiftwidth=2 expandtab  autoindent



" DEFAULTS:
" default d maker
let g:neomake_d_enabled_makers = ['dmd']
let g:neomake_tex_enabled_makers = ['xelatex']
" let g:neomake_pdc_enabled_makers = ['pdcHtml']


" OPTIONS:
" let g:neomake_tex_xelatex_buffer_output = 0
" let g:neomake_tex_xelatex_remove_invalid_entries = 1
"

" COMMANDS:
" https://www.gregjs.com/vim/2015/lint-as-you-type-with-neovim-and-neomake/
augroup agNeomake
    au!
    autocmd! BufWritePost,BufEnter *.py Neomake
    autocmd! BufWritePost,BufEnter *.d Neomake dmd
    " autocmd InsertLeave,TextChanged * update | Neomake

    autocmd! BufNewFile,BufRead *.py,*.python :command! Lint :Neomake
    " autocmd! FileType python :command! Lint :Neomake
    autocmd! BufNewFile,BufRead *.d :command! Lint :Neomake dmd
    " autocmd! FileType d command! Lint :Neomake dmd

    autocmd! FileType python nnoremap <leader>ll :Neomake<cr>
    autocmd! FileType d nnoremap <leader>ll :Neomake dmd<cr>

augroup END





