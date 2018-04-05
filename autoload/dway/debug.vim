
function! dway#debug#profiler_start()
    profile start profile.log
    profile func *
    profile file *
endfunction


function! dway#debug#profiler_stop()
    profile pause
    noautocmd qall!
endfunction


