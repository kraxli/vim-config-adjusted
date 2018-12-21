

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

autocmd BufRead,BufNewFile *.jl :set filetype=julia
autocmd BufRead,BufNewFile *.jl :set syntax=julia
" autocmd BufRead,BufNewFile *.py :set filetype=python.python3
" autocmd FileType python :set filetype=python.python3
au BufNewFile,BufRead *.nim set filetype=nim

" path to source file
" let g:scr_path=fnamemodify(expand('<sfile>:p'), ':h:h:h').'/scr'
let g:scr_path=fnamemodify(expand('<sfile>:p'), ':h').'/scr'
" }}} Path

" {{{ === Settings ===

set readonly!

" use dwc functions to send code lines to (ipython-)terminal. Alternative is bfredl/nvim-ipy
let g:dwc_ipython_terminal = 1
let g:dwc_terminal_keys = 1
let g:dwc_key_maps = 1

let g:path_tex_executables = 'C:\Program Files\MiKTeX 2.9\miktex\bin\x64\'

" }}}

" {{{ === Load Config files ===
" Initialize plugin manager 'plug.vim':
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/plugged.vim'

" original from vim-config:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/load_dw.vim'

" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"

" }}} load config file

" " set background=light
" " colorscheme PaperColor
" colorscheme codedark " papercolor
" let g:airline_theme = 'codedark'
" " let g:airline_theme='papercolor'

colorscheme codedark
command! BgToggle :<silent> call dway#misc#ToggleBgCs('codedark', 'PaperColor')<cr>
nmap <leader>b :call dway#misc#ToggleBgCs('codedark', 'PaperColor')<cr>
" nmap gx :Open<cr>
nnoremap gx F6

" command! ColorFold :hi Folded NONE | hi Folded ctermfg=215 ctermbg=238 guifg=#ffb964 guibg=#444444 |  hi FoldColumn ctermfg=215 ctermbg=238 guifg=#ffb964 guibg=#444444


hi Folded NONE | hi Folded cterm=italic ctermfg=246 ctermbg=235 gui=italic guifg=#999999 guibg=#252535
" Folded         xxx ctermfg=4 ctermbg=248 guifg=#0087af guibg=#afd7ff
" goDeclaration  xxx cterm=bold gui=bold guifg=#005faf
" vimCommentTitle xxx cterm=bold gui=bold guifg=#878787
" BufTabLineActive xxx guifg=#eeeeee guibg=#005faf
" Question       xxx ctermfg=75 ctermbg=234 guifg=#569CD6
" StatusLine     xxx ctermfg=236 ctermbg=248 guifg=#30302c guibg=#a8a897

" command! ColorFold :hi Folded NONE | hi Folded ctermfg=100 ctermbg=234 guifg=#CCC566 guibg=#1E1E1E |  hi FoldColumn ctermfg=100 ctermbg=234 guifg=#CCC566 guibg=#1E1E1E
"           xxx ctermfg=215 ctermbg=238 guifg=#ffb964 guibg=#444444
" User8          xxx ctermfg=215 ctermbg=236 guifg=#ffb964 guibg=#30302c

" ... Title          xxx cterm=bold gui=bold
" Visual         xxx ctermbg=24 guibg=#264F78
" .. cterm=reverse gui=reverse
"... ctermfg=188 ctermbg=235 guifg=#D4D4D4 guibg=#252526
"String         xxx ctermfg=173 guifg=#CE9178

command! Todo :e ~/Dropbox/PKD/vimwiki/ToDo.wiki<cr>

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" set guicursor=

let g:go_version_warning = 0

" vim: set foldmethod=marker
