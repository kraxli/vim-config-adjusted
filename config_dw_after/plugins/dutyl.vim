""""""""""""""""""""""""""""""""""""""""""""
"  d-lang / d-utyls / deoplete-d "
""""""""""""""""""""""""""""""""""""""""""""
" call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')
" call dutyl#register#tool('dcd-server', g:dwc_dcd_bin_dir.'dcd-server')

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


" vim: set filetype=vim :
