
command!  OpenBrowser :call dway#misc#OpenBrowser()
" change directory to current file one
command! Cd :cd %:p:h

"  Split windows  
command! VspL :vsp l

" save and quit
command! W :w
cnoreabbrev W w
cnoreabbrev Q q



