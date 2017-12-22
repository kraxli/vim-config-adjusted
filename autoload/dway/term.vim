
function! dway#term#term_gf()
    " let proc_cwd = <SID>get_proc_cwd()
    let proc_cwd = dway#base#get_proc_cwd()
    " exe 'lcd '.proc_cwd
    " exe 'e <cfile>'
    exe 'e '.proc_cwd.g:dway#base#os_path_sep.'<cfile>'
endfunction

function! dway#term#term_gf_tabnew()
    let proc_cwd = dway#base#get_proc_cwd()
    " exe 'lcd '.proc_cwd
    " exe 'e <cfile>'
    exe 'tabnew '.proc_cwd.g:dway#base#os_path_sep.'<cfile>'
endfunction

function! dway#term#openterm(place) abort
  let place = a:place 
  let currdir = expand("%:p:h")
  execute place
  execute 'lcd '.currdir
  execute 'terminal'
  exe "normal I"
endfunction


