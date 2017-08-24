
" errorformat: http://vim.wikia.com/wiki/Errorformats
" example: set efm=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#
" let &efm = '%E%f:%l:%c\,%n: %m,%Z%m' " '%E%f:%l: %m'

function PostprocessXelatexMaker(entry)
      " echo a:entry
      execute "!echo ".str(a:entry)." >>  /home/dave/temp/vimlog.log"
      if a:entry.text =~? '^\|\|'
        execute 'join!'
      endif
endfunction


let g:neomake_tex_xelatex_maker = {
        \ 'exe': 'xelatex',
        \ 'args': ['-file-line-error', '-interaction', 'nonstopmode'],
        \ 'errorformat': '%E%f:%l: %m'
    \ }
        " \ 'postprocess': function('PostprocessXelatexMaker')
let g:neomake_tex_enabled_makers = ['xelatex']
" let g:neomake_tex_xelatex_buffer_output = 0
" let g:neomake_tex_xelatex_remove_invalid_entries = 1


" default d maker
let g:neomake_d_enabled_makers = ['dmd']

augroup neomake
    au!
    autocmd! BufWritePost *.py Neomake
    autocmd! BufWritePost *.d Neomake dmd
augroup END




