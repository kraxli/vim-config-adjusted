
command!  OpenBrowser :call dway#misc#OpenBrowser()
" change directory to current file one
command! Cd :cd %:p:h

"  Split windows
command! VspL :vsp l

" save and quit
command! W :w
cnoreabbrev W w
cnoreabbrev Q q

command! ShowPath :echo expand('%:p')

" a little hack since vim-easygit has no general git command:
command! -nargs=* Git :!git <args>

" vim: foldmethod=marker:

