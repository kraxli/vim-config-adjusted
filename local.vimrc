

" {{{ === Individual settings / commands - unallocated stuff ===


" Commands
augroup IndividualCommands
    autocmd!
    " autocmd Filetype tex,latex inoremap ½ \frac{1}{2}
    " autocmd BufNewFile,BufRead *.latex inoremap ½ \frac{1}{2}
    command! PandocEx :tabnew ~/Dropbox/aCoding/Vim/Markdown/pandoc_example.pdc
augroup END


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

command! SpellEn :set spell spelllang=en<cr>
command! SpellDe :set spell spelllang=de<cr>
command! SpellEnDe :set spell spelllang=en,de<cr>
command! NoSpell :set nospell<cr>

command! SetPandocFold :set foldexpr=pandoc#folding#FoldExpr()<cr>


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

set readonly!
set noreadonly

set conceallevel=2 concealcursor=nv

au! MyAutoCmd BufNewFile,BufEnter,BufRead,BufCreate,BufReadPre  *.pdc,*.pandoc,*.md set filetype=pandoc
au! MyAutoCmd BufNewFile,BufEnter,BufRead,BufReadPost,BufReadPre *.pandoc,*.pdc,*.markdown,*.md,*.tex,*.vimwiki,*.wiki,*.txt, setl conceallevel=2 concealcursor=nv
au! MyAutoCmd FileType pandoc,markdown,tex,vimwiki,txt setl conceallevel=2 concealcursor=nv
au! MyAutoCmd FileType pandoc setlocal foldmethod=expr

command! GoPkd :cd ~/Dropbox/PKD

" }}}

" {{{
" to move:


" }}}

" autocmd VimEnter execute "source ".fnamemodify(expand('<sfile>'), ':h')."/startup.vim"



