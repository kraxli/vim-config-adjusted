
let g:dway#base#os_path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/') 

let g:dway#base#path_config_nvim = fnamemodify(expand('<sfile>'), ':h:h:h')
