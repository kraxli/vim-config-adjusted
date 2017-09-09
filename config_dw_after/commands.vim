
" TODO: broken
" command!  OpenBrowser :call dway#misc#OpenBrowser()

" change directory to current file one
command! Cd :cd %:p:h

" Split windows vertically and open empty buffer
command! Vspl :vsp l

" save and quit
command! W :w
cnoreabbrev W w

command! ShowPath :echo expand('%:p')
command! CopyBufferPath :let @+ = expand("%:p")

" a little hack since vim-easygit has no general git command:
command! -nargs=* Git :!git <args>

" dein plugin manager
command! DeinClean :call map(dein#check_clean(), "delete(v:val, 'rf')")
command! DeinUpdate :call dein#update() " update and install
command! DeinRecash :call dein#recache_runtimepath()
command! DeinInstall :call dein#install()
command! DeinReinstall :call dein#reinstall()



" vim: foldmethod=marker:

