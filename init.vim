
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

" set runtimepath+=~/Dropbox/VimWiki
" TODO:
" let g:dwc_dcd_bin_dir
      " let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
      " call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')

" {{{ === Path === 

if has('unix')
	 let $PATH=$PATH.';'.'~/.dutils/Dscanner/bin;~/.dutils/DCD/bin'
else
	 let  $PATH=$PATH.';'
endif

" }}} Path


" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_before/disable_plugins.vim'

" original from vim-config:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/load_dw.vim'


" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"


" vim: foldmethod=marker
