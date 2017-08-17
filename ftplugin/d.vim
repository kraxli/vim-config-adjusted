""""""""""""""""""""""""""""""""""""""""""""
"  d-lang / d-utyls / deoplete-d "
""""""""""""""""""""""""""""""""""""""""""""

if g:dlang_layer
   let g:deoplete#sources#d#dub_binary = '/usr/bin/dub'
   let g:deoplete#sources#d#dcd_server_autostart = 1
 
   if exists('g:dwc_dcd_bin_dir')
      let g:deoplete#sources#d#dcd_server_binary = g:dwc_dcd_bin_dir.'dcd-server'
      let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
      call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')
      call dutyl#register#tool('dcd-server', g:dwc_dcd_bin_dir.'dcd-server')
   endif

endif


""""""""""""""""""""""""""""""""""
"  dlang / d-util / deopleted-d  "
""""""""""""""""""""""""""""""""""
" let g:deoplete#sources#d#dcd_server_autostart = 1
" let g:deoplete#sources#d#dcd_client_binary = '/home/dave/.dutils/DCD/bin/dcd-client'
" let g:deoplete#sources#d#dcd_server_binary = '/home/dave/.dutils/DCD/bin/dcd-server'

" Dutyl will assume that tools are in the system's PATH. If they are not, you'll have to supply the path for them using dutyl#register#tool like so:
" call dutyl#register#tool('dcd-client','/usr/bin/dcd-client')
" call dutyl#register#tool('dcd-server','/usr/bin/dcd-server')

" or make symbolic link from the .dcd/DCD/bin directoires to the usr/bin dir

let g:dutyl_neverAddClosingParen=1
" let g:dutyl_tagsFileName='newnamefortagsfile'

" the following path seems to work:
" let g:dutyl_stdImportPaths=['/usr/include/dmd', '/usr/include/dmd/phobos']
let g:dutyl_stdImportPaths=['/usr/include/dmd', '/usr/include/dmd/phobos', '/usr/include/dmd/druntime/import', '/home/dave/.dub/packages/ggplotd-1.1.1/ggplotd/source', "/home/dave/.dub/packages/dstats-1.0.3/source", "/home/dave/.dub/packages/vibe-d-0.7.25/source/", "~/.dub/packages/consoled-1.0.4/source/", '/home/dave/.dub/packages/mir-0.22.0/mir/source', '/home/dave/.dub/packages/mir-0.22.0/mir/source/mir', '/home/dave/Dropbox/A_Coding/D/libdsmisc/source']


" STOP a client / server:
" 'dcd-client','--shutdown'

" or include the pathes by:
" dcd-client -I/home/dave/.dub/packages/dstats-1.0.3/source
" respecitvely by
" /home/dave/.dcd/DCD/bin/dcd-client  -I/home/dave/.dub/packages/dstats-1.0.3/source


" --- dfmt ---
"  for options see: https://github.com/Hackerpilot/dfmt
"  example:   dfmt --inplace --space_after_cast=false --max_line_length=80 \
"             --soft_max_line_length=70 --brace_style=otbs file.d


"""""""""""""""""""""""""""""""""""""""""""""""
"  vim-dlang-extra-highlight (extends vim.d)  "
"""""""""""""""""""""""""""""""""""""""""""""""
let g:d_class_scope_highlight = 1
let c_no_curly_error=1
 
