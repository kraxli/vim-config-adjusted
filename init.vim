

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'
" let g:python3_host_prog = '/home/dave/.pyenv/versions/python364/bin/python'
" let g:python3_host_prog = '/home/dave/.pyenv/versions/python351/bin/python'

" set runtimepath+=~/Dropbox/VimWiki
" TODO:
" let g:dwc_dcd_bin_dir
      " let g:deoplete#sources#d#dcd_client_binary = g:dwc_dcd_bin_dir.'dcd-client'
      " call dutyl#register#tool('dcd-client', g:dwc_dcd_bin_dir.'dcd-client')

" {{{ === Path ===

if has('unix')
	 let $PATH=$PATH.';'.'~/.dutils/Dscanner/bin;~/.dutils/DCD/bin'
else
	 let  $PATH=$PATH.';'
endif

" }}} Path

" {{{ === Settings ===
" use dwc functions to send code lines to (ipython-)terminal. Alternative is bfredl/nvim-ipy
let g:dwc_ipython_terminal = 1
let g:dwc_terminal_keys = 1
let g:dwc_key_maps = 1

let g:path_tex_executables = 'C:\Program Files\MiKTeX 2.9\miktex\bin\x64\'


" }}}

" original from vim-config:
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config/vimrc'

" execute 'source' fnamemodify(expand('<sfile>'), ':h').'/config_dw_after/terminal_nvim.vim'
execute 'source' fnamemodify(expand('<sfile>'), ':h').'/load_dw.vim'

" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"


au MyAutoCmd BufEnter,BufRead *.pdc,*.pandoc setlocal filetype=pandoc
au MyAutoCmd FileType pandoc setlocal foldmethod=expr

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" set guicursor=


" {{{ === Individual settings / commands - unallocated stuff ===
augroup IndividualCommands
      autocmd!
      au FileType tex,latex nnoremap F12 !xelatex %:p
      " autocmd Filetype tex,latex inoremap ½ \frac{1}{2}
      " autocmd BufNewFile,BufRead *.latex inoremap ½ \frac{1}{2}
      au FileType tex,latex,pandoc,pdc,txt,vimwiki,wiki setlocal spell spelllang=en,de
augroup END

command! PandocEx :tabnew ~/Dropbox/aCoding/Vim/Markdown/pandoc_example.pdc


colorscheme hybrid " gruvbox  hybrid
set background=dark

let color_scheme1 = 'hybrid'
let color_scheme2 = 'gruvbox'

nmap <leader>cs :call dway#misc#ToggleColorScheme(color_scheme1, color_scheme2)<cr>
noremap <leader>b :call dway#misc#ToggleBgCs(color_scheme1, color_scheme2)<cr>
nmap gb <c-o> " <c-;>

set statusline+=%F


" ORG-MODE:
let g:orgmode_directory="/home/dave/Dropbox/orgmode"

" Note the easiest to use is \V (capital):	the following chars in the pattern are "very nomagic" (only \ is magic)
hi hiOrgLink cterm=italic ctermfg=66 gui=italic guifg=#427b58
syn match OrgLink  /\V\zs\(http:\+\|file:\/\|~\/\|\/\)\S\+/
hi link OrgLink hiOrgLink

" }}} end individual settings / commands



" vim: set foldmethod=marker
