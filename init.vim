

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/home/dave/.pyenv/versions/python364/bin/python'

" To disable Python 2 support:
" let g:loaded_python_provider = 1

" set runtimepath+=~/Dropbox/VimWiki
" TODO:
" let g:dwc_dcd_bin_dir
" let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
" call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')

" {{{ === Paths ===

if has('unix')
  let $PATH=$PATH.';'.'~/.dutils/Dscanner/bin;~/.dutils/DCD/bin'
else
  let  $PATH=$PATH.';'
endif

" path to source file
" let g:scr_path=fnamemodify(expand('<sfile>:p'), ':h:h:h').'/scr'
let g:scr_path=fnamemodify(expand('<sfile>:p'), ':h').'/scr'
" }}} Path

" {{{ === Settings ===

set noreadonly
setl noreadonly

" use dwc functions to send code lines to (ipython-)terminal. Alternative is bfredl/nvim-ipy
let g:dwc_ipython_terminal = 1
let g:dwc_terminal_keys = 1
let g:dwc_key_maps = 1

let g:path_tex_executables = 'C:\Program Files\MiKTeX 2.9\miktex\bin\x64\'

" }}}

" {{{ === Load Config files ===
" Initialize plugin manager 'plug.vim':
" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/plugged.vim'

" original from vim-config:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/load_dw.vim'

" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"

" }}} load config file

" " set background=light
" " colorscheme PaperColor
colorscheme badwolf " codedark  papercolo
" {{{ keep folds on save
" https://stackoverflow.com/questions/37552913/vim-how-to-keep-folds-on-save
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END
" }}}


" ===================================================================
" Tabline {{{
" ---------------------------------------------------------
" TabLineFill: Tab pages line, where there are no labels
hi TabLineFill ctermfg=234 ctermbg=236 guifg=#1C1C1C guibg=#303030 cterm=NONE gui=NONE
" TabLine: Not-active tab page label
hi TabLine     ctermfg=243 ctermbg=236 guifg=#767676 guibg=#303030 cterm=NONE gui=NONE
" TabLineSel: Active tab page label
hi TabLineSel  ctermfg=241 ctermbg=234 guifg=#626262 guibg=#1C1C1C cterm=NONE gui=NONE
" Custom
highlight TabLineSelShade  ctermfg=235 ctermbg=234 guifg=#262626 guibg=#1C1C1C
highlight TabLineAlt       ctermfg=252 ctermbg=238 guifg=#D0D0D0 guibg=#444444
highlight TabLineAltShade  ctermfg=238 ctermbg=236 guifg=#444444 guibg=#303030

function! Tabline() abort "{{{
  " Active project tab
  let s:tabline =
    \ '%#TabLineAlt# %{badge#project()} '.
    \ '%#TabLineAltShade#▛'.
    \ '%#TabLineFill#  '

  let nr = tabpagenr()
  for i in range(tabpagenr('$'))
    if i + 1 == nr
      " Active tab
      let s:tabline .=
	\ '%#TabLineSelShade#░%#TabLineSel#'.
	\ '%'.(i+1).'T%{badge#label('.(i+1).', "▛", "N/A")} '.
	\ '%#TabLineFill#▞ '
    else
      " Normal tab
      let s:tabline .=
	\ '%#TabLine# '.
	\ '%'.(i+1).'T%{badge#label('.(i+1).', "▛", "N/A")} '.
	\ '▘ '
    endif
  endfor
  " Empty space and session indicator
  let s:tabline .=
    \ '%#TabLineFill#%T%=%#TabLine#%{badge#session("['.fnamemodify(v:this_session, ':t:r').']")}'
  return s:tabline
endfunction "}}}

let &tabline='%!Tabline()'
" }}}

" Statusline {{{
" https://hackernoon.com/the-last-statusline-for-vim-a613048959b2
" https://shapeshed.com/vim-statuslines/
let s:stl  = " %7*%{&paste ? '=' : ''}%*"         " Paste symbol
let s:stl .= "%4*%{&readonly ? '' : '#'}%*"       " Modifide symbol
let s:stl .= "%6*%{badge#mode('⚠ ', 'Z')}"        " Read-only symbol
let s:stl .= '%*%n'                               " Buffer number
let s:stl .= "%6*%{badge#modified('+')}%0*"       " Write symbol
let s:stl .= ' %1*%{badge#filename()}%*'          " Filename
let s:stl .= ' %<'                                " Truncate here
let s:stl .= '%( %{badge#branch()} %)'           " Git branch name
let s:stl .= "%4*%(%{badge#trails('⤐ %s')} %)"  " Whitespace
let s:stl .= '%(%{badge#syntax()} %)%*'           " syntax check
let s:stl .= '%='                                 " Align to right
let s:stl .= '%{badge#format()} %4*%*'           " File format
let s:stl .= '%( %{&fenc} %)'                     " File encoding
let s:stl .= '%4*%*%( %{&ft} %)'                 " File type
let s:stl .= '%3*%2* %l/%2c%4p%% '               " Line and column
let s:stl .= '%{badge#indexing()}%*'              " Indexing tags indicator

" Non-active Statusline {{{
let s:stl_nc = " %{badge#mode('⚠ ', 'Z')}%n"   " Readonly & buffer
let s:stl_nc .= "%6*%{badge#modified('+')}%*"  " Write symbol
let s:stl_nc .= ' %{badge#filename()}'         " Relative supername
let s:stl_nc .= '%='                           " Align to right
let s:stl_nc .= '%{&ft} '                      " File type
" }}}

" Highlights: Statusline {{{
highlight StatusLine   ctermfg=236 ctermbg=248 guifg=#30302c guibg=#a8a897
highlight StatusLineNC ctermfg=236 ctermbg=242 guifg=#30302c guibg=#666656

" Filepath color
highlight User1 guifg=#D7D7BC guibg=#30302c ctermfg=251 ctermbg=236
" Line and column information
highlight User2 guifg=#a8a897 guibg=#4e4e43 ctermfg=248 ctermbg=239
" Line and column corner arrow
highlight User3 guifg=#4e4e43 guibg=#30302c ctermfg=239 ctermbg=236
" Buffer # symbol and whitespace or syntax errors
highlight User4 guifg=#666656 guibg=#30302c ctermfg=242 ctermbg=236
" Write symbol
highlight User6 guifg=#cf6a4c guibg=#30302c ctermfg=167 ctermbg=236
" Paste symbol
highlight User7 guifg=#99ad6a guibg=#30302c ctermfg=107 ctermbg=236
" Syntax and whitespace
highlight User8 guifg=#ffb964 guibg=#30302c ctermfg=215 ctermbg=236
" }}}

let s:disable_statusline =
  \ 'denite\|defx\|tagbar\|nerdtree\|undotree\|diff\|peekaboo\|sidemenu\|vimfiler'

" Toggle Statusline {{{
augroup statusline
  autocmd!
  autocmd FileType,WinEnter,BufWinEnter,BufReadPost *
    \ if &filetype !~? s:disable_statusline
    \ |  let &l:statusline = s:stl
   \ |elseif &filetype == 'vimfiler'
\|	 let &l:statusline = ''
  \ | endif
  autocmd WinLeave *
    \ if &filetype !~? s:disable_statusline
    \ | let &l:statusline = s:stl_nc
   \ |elseif &filetype == 'vimfiler'
\|	 let &l:statusline = ''
  \ | endif
augroup END "}}}

" }}}


" vim: set foldmethod=marker
