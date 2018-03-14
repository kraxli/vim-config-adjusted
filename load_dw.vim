


" let g:dway#base#os_path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/') 


let g:config_load_home = fnamemodify(expand('<sfile>'), ':p:h:gs?\\?'.g:dway#base#os_path_sep.'?')
let g:config_folder = g:config_load_home.g:dway#base#os_path_sep."config_dw_after"
let g:config_plugins_folder = g:config_load_home.g:dway#base#os_path_sep."config_dw_after".g:dway#base#os_path_sep."plugins_load_at_startup"


" execute 'set rtp +=' . fnamemodify(g:config_load_home, ':p:h:h')
" execute 'set rtp +=' . fnamemodify(g:config_folder, ':p:h:h')
" execute 'set rtp +=' . fnamemodify(g:config_plugins_folder, ':p:h:h')


for file in split(globpath(g:config_folder, '*.vim'), '\n')
   execute 'source' file
endfor

for file in split(globpath(g:config_plugins_folder, '*.vim'), '\n')
   execute 'source' file
endfor


" fu! dwc#util#source_rc(file) abort
"     if filereadable(g:Config_load_Home. '/' . a:file)
"         execute 'source ' . g:Config_load_Home  . '/' . a:file
"     endif
" endf   

" vim:filetype=vim

