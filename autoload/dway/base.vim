
function! dway#base#get_proc_cwd()
    let procid = matchstr(bufname(""), '\(://.*/\)\@<=\(\d\+\)')
    let proc_cwd = resolve('/proc/'.procid.'/cwd')
    return proc_cwd
endfunction

let g:dway#base#os_path_sep = ((has('win16') || has('win32') || has('win64'))?'\':'/') 

let g:dway#base#path_config_nvim = fnamemodify(expand('<sfile>'), ':h:h:h')


" project root:
function! dway#base#AutoProjectRootLCD()
" function! <SID>AutoProjectRootCD()
try
    if &ft != 'help'
    ProjectRootLCD
    endif
catch
    " Silently ignore invalid buffers
endtry
endfunction

function! dway#base#IndentFile()
  " get line
  let line = line('.')
  let col = virtcol('.')
  execute "normal! gg=G"
  " execute ":".line
  call cursor(line, col)
endfunction
