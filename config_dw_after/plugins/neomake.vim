
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

    " works with Async python %:p
    " :set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]

let g:neomake_python_py3_maker = {
    \ 'exe': 'python3',
    \ 'errorformat': '\ %#File\ \"%f\"\\,\ line\ %l\\,\ %m,' .
    \ '\@File\:\ %f'
    \ }

" DEFAULTS:

" Default d maker:
let g:neomake_d_enabled_makers = ['dmd']

" Default tex maker:
let g:neomake_tex_enabled_makers = ['xelatex']
" let g:neomake_pdc_enabled_makers = ['pdcHtml']

" Python Makers:
" python default makers: ['python', 'frosted', 'pylama']
" let g:neomake_python_enabled_makers = ['python', 'frosted', 'pylama', 'vulture']
" ['pep8', 'pylint', 'flake8']


" CUSTOMIZE OPTIONS:
" let b:neomake_python_pylama_args
let g:neomake_python_pylama_args = ['--ignore', 'F403,F405,E261,W291,W293,E303,W391,E512']
let g:neomake_python_pep8_maker = { 'args': ['--max-line-length=100', '--ignore=E115,E266'], }
" let g:neomake_python_pylint_maker = {'args': ['--disable=C0103'], }
" --max-line-length='.g:python_syntax_max_line_length


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


" Notes / Sources:
" https://pythonadventures.wordpress.com/tag/neomake/
" http://vim.wikia.com/wiki/Errorformats
" https://www.gregjs.com/vim/2015/linting-code-with-neomake-and-neovim/
" jump to next error/waring: :ll /:ln (:lopen)


