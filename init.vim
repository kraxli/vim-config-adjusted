

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/home/dave/.pyenv/versions/python364/bin/python'
" let g:python3_host_prog = '/home/dave/.pyenv/versions/python351/bin/python'

" set runtimepath+=~/Dropbox/VimWiki
" TODO:
" let g:dwc_dcd_bin_dir
      " let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
      " call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')

" {{{ === Paths ===

if has('unix')
	 let $PATH=$PATH.';'.'~/.dutils/Dscanner/bin;~/.dutils/DCD/bin'
else
	 let  $PATH=$PATH.';'

endif

" path to source file
let g:scr_path=fnamemodify(expand('<sfile>:p'), ':h:h:h').'/scr'
" }}} Path

" {{{ === Settings ===

set readonly!

" use dwc functions to send code lines to (ipython-)terminal. Alternative is bfredl/nvim-ipy
let g:dwc_ipython_terminal = 1
let g:dwc_terminal_keys = 1
let g:dwc_key_maps = 1

let g:path_tex_executables = 'C:\Program Files\MiKTeX 2.9\miktex\bin\x64\'

" }}}

" {{{ === Load Config files ===
" Initialize plugin manager 'plug.vim':
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/plugged.vim'

" original from vim-config:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/load_dw.vim'

" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"

" }}} load config file


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" set guicursor=
" vim: set foldmethod=marker
