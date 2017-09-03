""""""""""""""""""""""""""""""""""""""""""""
"  d-lang / d-utyls / deoplete-d "
""""""""""""""""""""""""""""""""""""""""""""

" == path settings ==
let g:dwc_dcd_bin_dir='/home/dave/.dutils/DCD/bin/'
let g:deoplete#sources#d#dub_binary = '/usr/bin/dub'
" let $PATH=+'~/.dutils/D-Scanner/bin;~/.dutils/dfmt/bin'

" == further settings ==
let g:deoplete#sources#d#dcd_server_autostart = 1
let g:dutyl_neverAddClosingParen=1
" let g:dutyl_tagsFileName='newnamefortagsfile'

" == set path to import folders == 
" the following path seems to work:
" let g:dutyl_stdImportPaths=['/usr/include/dmd', '/usr/include/dmd/phobos']
let g:dutyl_stdImportPaths=['/usr/include/dmd', '/usr/include/dmd/phobos', '/usr/include/phobos', '/usr/include/dmd/druntime/import', '/home/dave/.dub/packages/ggplotd-1.1.1/ggplotd/source', "/home/dave/.dub/packages/dstats-1.0.3/source", "/home/dave/.dub/packages/vibe-d-0.7.25/source/", "~/.dub/packages/consoled-1.0.4/source/", '/home/dave/.dub/packages/mir-0.22.0/mir/source', '/home/dave/.dub/packages/mir-0.22.0/mir/source/mir', '/home/dave/Dropbox/A_Coding/D/libdsmisc/source']


let g:deoplete#sources#d#dcd_server_binary = g:dwc_dcd_bin_dir.'dcd-server'
let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')
call dutyl#register#tool('dcd-server', g:dwc_dcd_bin_dir.'dcd-server')
" or make symbolic link from the .dcd/DCD/bin directoires to the usr/bin dir

" call deoplete#custom#set('d',          'mark', '⌁')
" call deoplete#custom#set('d',          'rank', 640)


" let g:deoplete#sources.d = ['buffer', 'tag', 'ultisnips']


" STOP a client / server:
" 'dcd-client','--shutdown'

" or include the pathes by:
" dcd-client -I/home/dave/.dub/packages/dstats-1.0.3/source
" respecitvely by
" /home/dave/.dcd/DCD/bin/dcd-client  -I/home/dave/.dub/packages/dstats-1.0.3/source


" --- dfmt ---
"  for options see: https://github.com/Hackerpilot/dfmt
command! -nargs=* Dfmt :!dfmt <args>
command! Dformat :!dfmt --inplace --space_after_cast=false --max_line_length=120
	\ --soft_max_line_length=110 --brace_style=otbs %:p<cr>


"""""""""""""""""""""""""""""""""""""""""""""""
"  vim-dlang-extra-highlight (extends vim.d)  "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:d_class_scope_highlight = 1
let c_no_curly_error=1
 
" vim: set filetype=vim :
