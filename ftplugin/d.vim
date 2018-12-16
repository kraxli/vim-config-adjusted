
" https://stackoverflow.com/questions/15052044/vim-folding-with-rainbowparentheses
setl foldmethod=syntax
setl foldenable
setl foldlevel=100
setl foldcolumn=2
setl foldlevelstart=1

if ! exists('g:gui_oni')

  let g:dmisc_dcd_bin_dir='/home/dave/.dutils/dcd/bin/'

  " call dutyl#register#tool('dcd-client', g:dmisc_dcd_bin_dir.'dcd-client')
  " call dutyl#register#tool('dcd-server', g:dmisc_dcd_bin_dir.'dcd-server')
  " autocmd MyAutoCmd BufRead,BufEnter *.d DUDCDrestartServer

  let g:dutyl_stdImportPaths=['/snap/dmd/current/import/druntime', '/snap/dmd/31/import/phobos']

endif

augroup DlangAutoCmd
  " Note: au! ... will would delete all the previously set commands in the group DlangAutoCmd
  au!

  " ============================================
  " Comment string to use in tpope/vim-commentary
  " --------------------------------------------
  " autocmd FileType apache setlocal commentstring=#\ %s
  autocmd FileType d set commentstring=//\ %s

  " ============================================
  " DFMT:
  " --------------------------------------------
  " Predefined dfmt:
  if executable('dfmt')
    au FileType d command! -nargs=* Dfmt :silent !dfmt %:p -i --indent_style=tab --indent_size=2 --max_line_length=100 --brace_style=stroustrup --space_after_cast=false  <f-args>

    " Customizable dfmt (set your own options):
    au FileType d command! -nargs=* DfmtC :silent !dfmt -i <f-args> %:p
    " autocmd MyAutoCmd FileType d nnoremap <silent><buffer> <c-d>f :Dfmt<cr>
  endif

  " ============================================
  " DFIX:
  " --------------------------------------------
  if executable('dfix')
    au  FileType d command! Dfix :silent !dfix %:p
  endif

  " ============================================
  " Dscanner:
  " --------------------------------------------
  if executable('dscanner')
    au  FileType d command! Dscanner :silent !dscanner %:p
  endif

  " ============================================
  " Misc:
  " --------------------------------------------

  au FileType d command! OpenDmdConf :e ~/dmd.conf
  " ['/snap/dmd/current/import/druntime', '/snap/dmd/31/import/phobos']
  au FileType d command! ExPhobos :V  /snap/dmd/31/import/phobos
  au FileType d command! ExRuntime :V  /snap/dmd/current/import/druntime
  au FileType d command! OpenPhobos :ExPhobos<cr>
  au FileType d command! OpenRuntime :ExRuntime<cr>

augroup END

" tagbar:
let g:tagbar_type_d = {
  \ 'ctagstype' : 'd',
  \ 'kinds'     : [
  \ 'c:classes:1:1',
  \ 'f:functions:1:1',
  \ 'T:template:1:1',
  \ 'g:enums:1:1',
  \ 'e:enumerators:0:0',
  \ 'u:unions:1:1',
  \ 's:structs:1:1',
  \ 'v:variables:1:0',
  \ 'i:interfaces:1:1',
  \ 'm:members',
  \ 'a:alias'
  \ ],
  \'sro': '.',
  \ 'kind2scope' : {
  \ 'c' : 'class',
  \ 'g' : 'enum',
  \ 's' : 'struct',
  \ 'u' : 'union',
  \ 'T' : 'template',
  \},
  \ 'scope2kind' : {
  \ 'enum'      : 'g',
  \ 'class'     : 'c',
  \ 'struct'    : 's',
  \ 'union'     : 'u',
  \ 'template'  : 'T',
  \ },
  \ 'ctagsbin' : 'dscanner',
  \ 'ctagsargs' : ['--ctags']
\ }

