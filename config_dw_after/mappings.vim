
" {{{ === key mappings ===

imap jj <esc>

" =======================================================
" {{{ Window and tabs
" --------
nnoremap <c-w>< <c-w>5<

" open and colose (new) tab
map <leader>nt :tabnew<cr>
map <leader>ct :tabclose<cr>

" move split windows right / left
noremap <s-m-Right> <esc><c-w>r
noremap <silent> <s-m-Left> <esc><c-w>r
nmap <silent> <m-Down> :hide<cr>
nmap <silent> <m-Up> :only<cr> " <c-w>o
nmap <silent> <m-Right> :vsp\|bp<cr>

" move between split windows
map <silent> <c-Up> :wincmd k<CR>
map <silent> <c-Down> :wincmd j<CR>
map <silent> <c-Left> :wincmd h<CR>
map <silent> <c-Right> :wincmd l<CR>

" move beween tabs
nmap <silent> <c-PageUp> :tabprevious<cr>
nmap <silent> <c-PageDown> :tabnext<cr>

" close buffers
" noremap <silent> Qq :q!
" noremap <silent> Qa :qa!

" }}}

nnoremap ;ii :execute "e ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>
nnoremap ;ss :execute "source ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>

" expand file name root
imap ;fn <c-r>=expand('%:t:r')<cr>

" map <C-m> ]c

" go back (to last position)
nnoremap gb <c-o> " <c-;>
" go to next/forward
nnoremap gn <c-i>
if has('gui')
  noremap <C-BS> <c-o>
  noremap <S-C-BS> <c-i>
endif

" indent
nmap <c-i> :call dway#base#IndentFile()<cr>
vmap <c-i> =

" jump to quickfix or location list/window
nmap <script> <silent> <leader>cc :call dway#misc#ToggleQuickFix()<CR>
nmap <script> <silent> <leader>ll :call dway#misc#ToggleLocationList()<CR>
" nnoremap <leader>c :cnext<cr> " probably
" nnoremap <leader>l :lnext<cr>

" nnoremap <space>c :copen<cr>
" " nnoremap <leader><space> :cclose<cr>
" nnoremap <space>l :lopen<cr>


" change directory to the one of the current file
map <leader>cd :lcd %:p:h<cr>
map <leader>gcd :cd %:p:h<cr>

" Backgournd
nmap <leader>cs :call dway#misc#ToggleColorScheme(color_scheme1, color_scheme2)<cr>
" noremap <leader>b :call dway#misc#ToggleBgCs(color_scheme1, color_scheme2)<cr>

" toggle spelling (<leader>se)
nnoremap <F2> :set spell! spelllang=en,de <cr>


" {{{ == Folding ==
" toggle folds (or <F8> instead of zt)
inoremap <c-z> <C-O>za
nnoremap <c-z> za
onoremap <c-z> <C-C>za
" make fold from visual selection
vnoremap <c-z> zf
" Focus the current fold by closing all others
nnoremap <c-s-z> zMza
" nnoremap <c-s-z> zM<Right>
" nnoremap <c-s-z> zMzo


" Search for a pattern then press F10 to fold misses.
nnoremap <F10> :setlocal foldexpr=(getline(v:lnum)!~@/) foldmethod=expr<CR><Bar>zM
" TODO: restore original foldmethod (hack: simply by reloading file with ":e" )

if has('gui')
  nnoremap <s-F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
else
  nnoremap z<F10> :setlocal foldexpr=(getline(v:lnum)=~@/) foldmethod=expr<CR><Bar>zM
endif

" fold by search
nnoremap zs :setlocal foldexpr=(getline(v:lnum)=~@/)?0:(getline(v:lnum-1)=~@/)\\|\\|(getline(v:lnum+1)=~@/)?1:2 foldmethod=expr foldlevel=0 foldcolumn=2<CR>

" }}} folding

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ filetyp specfic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
au MyAutoCmd FileType markdown nnoremap <backspace> :bp<cr>
" au MyAutoCmd Filetype markdown,vimwiki nmap <silent><c-g>b :call dway#markdown#OpenInBrowser('%')<cr><cr>
au MyAutoCmd Filetype markdown,vimwiki nmap <silent><c-o>b :call dway#markdown#OpenInBrowser('%')<cr><cr>
" au MyAutoCmd Filetype vimfiler nmap <silent><c-g>b :call dway#markdown#OpenInBrowser('<cfile>')<cr><cr>
au MyAutoCmd Filetype vimfiler nmap <silent><c-g>b :call dway#markdown#OpenInBrowser('<cfile>')<cr><cr>

augroup GroupMarkdown
  autocmd!
  " hf is more in line with hb
  au FileType markdown,vimwiki :nmap <localleader>hf <localleader>hn
  " same command for .tex files in tex.vim
  au FileType markdown,vimwiki :nmap <c-o>p :!evince %:p:r.pdf & <cr><cr>
  set tabstop=2 softtabstop=2 shiftwidth=2 expandtab  autoindent

augroup END



" }}} filetype specifc

" {{{ == search highlighting ==

" Press Space Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <space><space> :nohlsearch<Bar>:echo<CR>
"nmap <silent> <C-N> :silent noh<CR>

" Press F3 to toggle highlighting on/off, and show current value.
noremap <F3> :set hlsearch! hlsearch?<CR>:echo<CR>

" Or, press return to temporarily get out of the highlighted search.
"nnoremap <CR> :nohlsearch<CR><CR>

" }}} search highligh

" simplify indenting (redundant due to vim-config) / also but differently set in config/mappings.vim
nnoremap > >>$
nnoremap < <<$

"" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

"" set text wrapping toggles
"nmap <silent> ,ww :set invwrap<CR>:set wrap?<CR>

"" Underline the current line with '='
nmap <silent> <leader>u0 :t.\|s/./=/g\|:nohls<cr>
" Underline the current line with '-'
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

"" Use CTRL-E to replace the original ',' mapping
" nnoremap <C-E> ,

"" Make the current file executable
if has("unix")
  " :w<cr>:!external_command -> send :w (current line / mark) to external command
  nmap <leader>x :w<cr>:!chmod 755 %<cr>:e<cr>
endif

"" put the vim directives for my file editing settings in
"nmap <silent> ,vi ovim:set ts=2 sts=2 sw=2:<CR>vim600:fdm=marker fdl=1 fdc=0:<ESC>

" very useful for figuring out what to change as far as syntax highlighting goes.
"nmap <silent> ,qq :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" http://www.google.com asdf asd fsdfadsfdsf

" Browse old files
noremap <leader>bof :browse oldfiles

" open file under cursor in new vim-tab
" nnoremap <leader>g<s-f> <c-w>gf
nnoremap g<s-f> <c-w>gf

" Include Time Stamps
nnoremap <silent> <F4> "=strftime("%Y-%m-%d")<CR>P
inoremap <silent> <F4> <C-R>=strftime("%Y-%m-%d")<CR>

" path
" echo expand('%:p:r')

" replace word under cursor in whole file
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

nnoremap c<F12> :call dway#misc#ToggleColorScheme('gruvbox', 'Tomorrow')<cr>
" " Toggle background (see <leader>b)
" nnoremap b<F12>  :let &background = ( &background == "dark"? "light" : "dark" )\|syntax on<CR>

" tables / tabular
vnoremap <leader>pt :call dway#table#table()<cr>
vnoremap <leader>ptt :call dway#table#table()<cr> gv :!pandoc -f markdown -t rst<cr>
inoremap <silent> <Bar>   <Bar><Esc>:call dway#table#align()<CR>a

"%\\@=%m open system file explorer (not need: handeled by vim-shell)
" nnoremap <F6> :call dway#misc#OpenExplorer('%:p:h')

" Lower / Upper Case, Inital Upper Case And Toggle Case:
vnoremap ~ y:call setreg('', dway#misc#TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

" quick spell correction:
" It basically jumps to the previous spelling mistake [s, then picks the first suggestion 1z=,
" and then jumps back `]a. The <c-g>u in the middle make it possible to undo the spelling correction quickly.
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Plugins specific mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" toggle tagbar
" nnoremap <leader>t :TagbarToggle<cr>
nnoremap <silent><leader>tb :TagbarToggle<CR>

" vim-projectroot
nnoremap <silent><leader>pr :ProjectRootCD<cr>

" LimeLight
nmap ;ll :Limelight!!<cr>

" shell-vim
" open file explorere
" open files, url, ... (default map in vim-shell is F6)
nnoremap <c-o>o yiW:Open <cr>
" nnoremap <c-o>e yiW:Open <cr>
" nnoremap <leader>o :OpenBrowser <cr>
" nmap fe <F6>
" gx / ge from pandoc and netrw does the job for many things
" a good map candidate would also be <c-enter>

" Startify
nnoremap ;sf :Startify

" Gundo
nnoremap <c-g>d :GundoToggle<cr>

" nvim-r
augroup nvimr
  au!
  autocmd Filetype r nmap <buffer> ;e <Plug>RSendLine
  autocmd Filetype r vmap <buffer> ;e <Plug>RSendSelection

augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" other operator surround mappings than rafi uses (his do not realy
" work for me)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if dein#tap('vim-operator-surround')
" 	map <silent>oa <Plug>(operator-surround-append)
" 	map <silent>od <Plug>(operator-surround-delete)
" 	" map <silent>or <Plug>(operator-surround-replace)
" 	nmap <silent>or <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" 	nmap <silent>oaa <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
" 	nmap <silent>odd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
" 	nmap <silent>orr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
" endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TERMINAL Mappings for Neovim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('nvim')
  " To map <Esc> to exit terminal-mode: >
  tnoremap <Esc> <C-\><C-n>

  " To simulate |i_CTRL-R| in terminal-mode: >
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

  " To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
  tnoremap <c-left> <esc><C-\><C-N><C-w>h
  tnoremap <c-down> <esc><C-\><C-N><C-w>j
  tnoremap <c-up> <esc><C-\><C-N><C-w>k
  tnoremap <c-right> <esc><C-\><C-N><C-w>l
  " inoremap <A-h> <C-\><C-N><C-w>h
  " inoremap <A-j> <C-\><C-N><C-w>j
  " inoremap <A-k> <C-\><C-N><C-w>k
  " inoremap <A-l> <C-\><C-N><C-w>l
  " nnoremap <A-h> <C-w>h
  " nnoremap <A-j> <C-w>j
  " nnoremap <A-k> <C-w>k
  " nnoremap <A-l> <C-w>l

  augroup Terminal
    au!
    " au TermOpen * nmap <buffer> gf :call dway#term#term_gf()<cr>
    au TermOpen * nmap <buffer> <cr> :call dway#term#term_gf()<cr>
    " au TermOpen * tnoremap <buffer> gt :call dway#term#term_gf_tabnew()<cr>
    au TermOpen * nmap <buffer> gt :call dway#term#term_gf_tabnew()<cr>
    au TermOpen * nmap <buffer> <c-cr> :call dway#term#term_gf_tabnew()<cr>
  augroup END
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings for lldb.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if dwc_key_maps
  " lldb.nvim (dlang)
  nmap <M-b> <Plug>LLBreakSwitch
  " nmap <c-b> <Plug>LLBreakSwitch
  vmap <F2> <Plug>LLStdInSelected
  nnoremap <F4> :LLstdin<CR>
  " nnoremap <F5> :LLmode debug<CR>
  " nnoremap <S-F5> :LLmode code<CR>
  nnoremap <F8> :LL continue<CR>
  nnoremap <S-F8> :LL process interrupt<CR>
  nnoremap <F7> :LL print <C-R>=expand('<cword>')<CR><cr>
  vnoremap <F7> :<C-U>LL print <C-R>=lldb#util#get_selection()<CR><CR>
endif "dwc_key_maps

"""""""""""""""""""""""""""""""""""""""""""""""""""
" R
"""""""""""""""""""""""""""""""""""""""""""""""""""

" send to terminal
" vmap
" nmap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" command line mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" }}} plugin specific
" }}} key mappings

au MyAutoCmd Filetype markdown map <leader>ob :silent execute("call dway#markdown#OpenInBrowser('%')")<cr>

