
function! dway#profiler_start() 
    profile start profile.log
    profile func *
    profile file *
endfunction


function! dway#profiler_stop() 
    profile pause
    noautocmd qall!
endfunction


