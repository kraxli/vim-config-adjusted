
" TODO: broken
" command!  OpenBrowser :call dway#misc#OpenBrowser()

command! Ln :lne
command! Cn :cn

" change directory to current file one
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! Ecurrent :lcd %:p:h | :E
command! Ec :Ecurrent

" Split windows vertically and open empty buffer
command! Vspl :vsp l

command! VTermCwd :vsp +term " or :vsp|terminal
command! TTermCwd :tabnew +term " or :tabnew|terminal
command! TermCwd :terminal
command! VTerm :call dway#term#openterm('vsp')
command! TTerm :call dway#term#openterm('tabnew')

" over rule the read only option when opening a file
 cnoreabbrev ww w!
 cnoreabbrev xx x!
 cnoreabbrev qq q!

" save and quit
command! W :w
command! Q :q

command! ShowPath :echo expand('%:p')
command! CopyBufferPath :let @+ = expand("%:p:h")
" command! CopyBufferName :let @+ = expand("%:r")
command! CopyBufferName :let @+ = expand("%:p")

" a little hack since vim-easygit has no general git command:
command! -nargs=* Git :!git <args>

" dein plugin manager
command! DeinClean :call map(dein#check_clean(), "delete(v:val, 'rf')")
command! DeinUpdate :call dein#update() " update and install
command! DeinRecash :call dein#recache_runtimepath()
command! DeinInstall :call dein#install()
command! DeinReinstall :call dein#reinstall()

" div
if has('unix')
   command! -bar ShaDaDelete NeomakeSh! rm ~/.local/share/nvim/shada/* | NeomakeSh! touch ~/.local/share/nvim/shada/main.shada
   command! ShaDaFix wshada!
endif

" GIT / Denite
command! Glog :Denite gitlog
command! GstatusDenite :Denite gitstatus
command! Gchanged :Denite gitchanged
command! -nargs=+ Git :NeomakeSh git <args>
command! GaddAll :Gadd --all
command! -nargs=+ GcommitAll :NeomakeSh git commit -m <q-args> -a
command! -nargs=+ GcommitThis :NeomakeSh git commit -m <q-args> %:h
command! GaddThis :Gadd %:h


" vim: foldmethod=marker:
