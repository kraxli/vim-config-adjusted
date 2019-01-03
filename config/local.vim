

" {{{ === Individual settings / commands - unallocated stuff ===

let g:cmd_default_browser='firefox'

" PANDOC
let g:pkd_directory="/home/dave/Dropbox/PKD/"

" nmap ;kk :execute "Ex ".g:pkd_directory<cr>
nmap ;kk :execute  "VimFiler ".g:pkd_directory<cr>
nmap ;nn :execute "VimFilerSimple ".g:pkd_directory."/notes"<cr>


nnoremap <leader>gq :%!pandoc -f html -t markdown<CR>
vnoremap <leader>gq :!pandoc -f html -t markdown<CR>

" Commands
augroup IndividualCommands
    autocmd!
    " autocmd Filetype tex,latex inoremap ½ \frac{1}{2}
    " autocmd BufNewFile,BufRead *.latex inoremap ½ \frac{1}{2}
augroup END


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

command! SpellDe :execute('set spell spelllang=de')
command! SpellEn :execute('set spell spelllang=en')
command! SpellEnDe :execute('set spell spelllang=en,de')
command! NoSpell :execute('set nospell')
command! SpellOff :execute('set nospell')


" }}}

" {{{ === Key maps ===


" }}}

" {{{ final settings

set colorcolumn=100

au! Filetype vim setl foldmethod=marker
"indent

if expand('%:t') != 'plugins.yaml'
  setlocal nospell
endif
autocmd! BufRead,BufNewFile,BufEnter,BufWrite,BufReadPre,BufWritePre,BufWritePost plugins.yaml setlocal nospell

set conceallevel=2 concealcursor=c

command! GoPkd :cd ~/Dropbox/PKD

" load some mappings to quickly access as some files
execute 'source '."~/Dropbox/ActiveHome/.settings/quickfiles.vim"


" }}}

" {{{
" to move:


" }}}

" autocmd VimEnter execute "source ".fnamemodify(expand('<sfile>'), ':h')."/startup.vim"



