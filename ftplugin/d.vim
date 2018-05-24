
let g:dmisc_dcd_bin_dir='/home/dave/.dutils/dcd/bin/'

" call dutyl#register#tool('dcd-client', g:dmisc_dcd_bin_dir.'dcd-client')
" call dutyl#register#tool('dcd-server', g:dmisc_dcd_bin_dir.'dcd-server')
" autocmd MyAutoCmd BufRead,BufEnter *.d DUDCDrestartServer

" ============================================
" DFMT:
" --------------------------------------------
au! MyAutoCmd FileType d command! Dfmt :silent !dfmt -i --indent_style=tab --indent_size=2 --max_line_length=80 --brace_style=stroustrup --space_after_cast=false --align_switch_statements=true  %:p


" autocmd MyAutoCmd FileType d nnoremap <silent><buffer> <c-d>f :Dfmt<cr>

