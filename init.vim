
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_before/disable_plugins.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim_dw.vim'

set wrap

