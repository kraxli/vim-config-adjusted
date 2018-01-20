

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


let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
" set guicursor=


" {{{ === Individual settings / commands - unallocated stuff ===
augroup IndividualCommands
      autocmd!
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


" THINGS DO MOVE ELSEWHERE
"
" PANDOC
let g:pkd_directory="/home/dave/Dropbox/PKD/"

nnoremap <leader>gq :%!pandoc -f html -t markdown<CR>
vnoremap <leader>gq :!pandoc -f html -t markdown<CR>


" Note the easiest to use is \V (capital):	the following chars in the pattern are "very nomagic" (only \ is magic)
hi hiOrgLink cterm=italic ctermfg=66 gui=italic guifg=#427b58
syn match OrgLink  /\V\zs\(http:\+\|file:\/\|~\/\|\/\)\S\+/
hi link OrgLink hiOrgLink

" }}} end individual settings / commands

" {{{ commands

nnoremap <c-1>  <c-w>+ 

" nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
" nnoremap <silent> <Leader>+ :exe "resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <c-w>2 :vertical exe "resize 10"<CR>
" nnoremap <silent> <c-w>0 10<c-w><
nnoremap <silent> <c-w>0 :vertical exe "resize -10"<CR>

" Toggle Limelight
au FileType pandoc,markdown,tex,vimwiki,txt nnoremap <buffer> F5 :Limelight!!

command! PathClean :s/\([ :,?+]\+\)/_/g

" }}}

" {{{ final settings

au! Filetype vim setl=marker "indent

if expand('%:t') != 'plugins.yaml'
  setlocal nospell
endif
autocmd! BufRead,BufNewFile,BufEnter,BufWrite plugins.yaml setlocal nospell

set readonly!
set noreadonly

set conceallevel=2 concealcursor=nv

au! MyAutoCmd BufEnter,BufRead *.pdc,*.pandoc,*.md setlocal filetype=pandoc
" au BufEnter,BufRead,BufCreate,BufNewFile,BufReadPre *.pdc,*.pandoc,*.md set filetype=pandoc
au! BufNewFile,BufEnter,BufRead,BufReadPost,BufReadPre *.pandoc,*.pdc,*.markdown,*.md,*.tex,*.vimwiki,*.wiki,*.txt, setl conceallevel=2 concealcursor=nv
" au MyAutoCmd BufEnter,BufRead *.md,*.markdown setlocal filetype=pandoc
au MyAutoCmd FileType pandoc setlocal foldmethod=expr
au FileType pandoc,markdown,tex,vimwiki,txt setl conceallevel=2 concealcursor=nv



" }}}

" vim: set foldmethod=marker
