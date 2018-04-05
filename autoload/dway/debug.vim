
function! dway#debug#profiler_start(...)
    let file_name = a:0 > 0 ? a:1 : "profile.log"
    execute "profile start ".file_name
    profile func *
    profile file *
endfunction


function! dway#debug#profiler_stop()
    profile pause
    noautocmd qall!
endfunction


