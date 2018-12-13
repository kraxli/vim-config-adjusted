
" TODO: broken
" command!  OpenBrowser :call dway#misc#OpenBrowser()

command! Ln :lne
command! Cn :cn

" change directory to current file one
command! Cd :cd %:p:h
command! Lcd :lcd %:p:h
command! Ecurrent :lcd %:p:h | :E
command! Ec :Ecurrent

" Open file in browser
au MyAutoCmd Filetype markdown command! OB :silent execute("call dway#markdown#OpenInBrowser('%')")
" au MyAutoCmd Filetype vimfiler command! OB :silent execute("call dway#markdown#OpenInBrowser('<cfile>')")


" =======================================================
" Windwos
" Split windows vertically and open empty buffer
command! Vspl :vsp l

command! VTermCwd :vsp +term " or :vsp|terminal
command! TTermCwd :tabnew +term " or :tabnew|terminal
command! TermCwd :terminal
command! VTerm :call dway#term#openterm('vsp')
command! TTerm :call dway#term#openterm('tabnew')

" over rule the read only option when opening a file
 cnoreabbrev <silent> ww w!
 cnoreabbrev <silent> xx x!
 cnoreabbrev <silent> qq q!

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
command! DeinClean
    \ :call map(dein#check_clean(), "delete(v:val, 'rf')") |
    \ :call dein#recache_runtimepath()

command! DeinUpdate :call dein#update() " update and install
command! DeinRecache :call dein#recache_runtimepath()
command! DeinInstall :call dein#install()
command! DeinReinstall :call dein#reinstall()
command! DeinRemotes :call dein#remote_plugins() | UpdateRemotePlugins
command! DeinInfo :call dein#check_install()

" div
if has('unix')
   command! -bar ShaDaDelete AsyncRun! rm ~/.local/share/nvim/shada/* | AsyncRun! touch ~/.local/share/nvim/shada/main.shada
   command! ShaDaFix wshada!
endif

" GIT / Denite
command! Glog :Denite gitlog
command! GstatusDenite :Denite gitstatus
command! Gchanged :Denite gitchanged
command! -nargs=+ Git :AsyncRun git <args>
command! GaddAll :Gadd --all
command! Gamend :AsyncRun git commit --all --amend --no-edit
command! -nargs=+ GcommitAll :AsyncRun git commit -m <q-args> -a
command! -nargs=+ GcommitThis :AsyncRun git commit -m <q-args> %
command! GaddThis :AsyncRun git add %

" profiling / debuggin vim
command! -nargs=* ProfilerStart :call dway#debug#profiler_start(<q-args>)
command! ProfilerStop :call dway#debug#profiler_stop()


" vim: foldmethod=marker:
