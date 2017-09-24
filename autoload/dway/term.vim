
function! dway#term#term_gf()
    let proc_cwd = <SID>get_proc_cwd()
    " exe 'lcd '.proc_cwd
    " exe 'e <cfile>'
    exe 'e '.proc_cwd.g:dway#base#os_path_sep.'<cfile>'
endfunction

function! dway#term#term_gf_tabnew()
    let proc_cwd = <SID>get_proc_cwd()
    " exe 'lcd '.proc_cwd
    " exe 'e <cfile>'
    exe 'tabnew '.proc_cwd.g:dway#base#os_path_sep.'<cfile>'
endfunction

function! s:get_proc_cwd()
    let procid = matchstr(bufname(""), '\(://.*/\)\@<=\(\d\+\)')
    let proc_cwd = resolve('/proc/'.procid.'/cwd')
    return proc_cwd
endfunction


