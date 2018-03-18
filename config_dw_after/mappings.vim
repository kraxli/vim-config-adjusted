
" {{{ === key mappings ===

imap jj <esc>

nnoremap ;ee :execute "e ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>
nnoremap ;uu :execute "source ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>

nnoremap bd :BD

" expand file name root
imap ;fn <c-r>=expand('%:t:r')<cr>

" map <C-m> ]c

" go back (to last position)
nnoremap gb <c-o>  " <c-;>
" go to previous/forward
nnoremap gp <c-i>
if has('gui')
   noremap <C-BS> <c-o>
   noremap <S-C-BS> <c-i>
endif

" jump to quickfix or location list/window
nmap <script> <silent> <leader>cc :call dway#misc#ToggleQuickFix()<CR>
nmap <script> <silent> <leader>ll :call dway#misc#ToggleLocationList()<CR>
nnoremap <leader>c :cnext<cr> " probably 
nnoremap <leader>l :lnext<cr>
" nnoremap <space>c :copen<cr>
" " nnoremap <leader><space> :cclose<cr>
" nnoremap <space>l :lopen<cr>

 " open and colose (new) tab
map <leader>nt :tabnew<cr>
map <leader>ct :tabclose<cr>

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
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>

"" Use the bufkill plugin to eliminate a buffer but keep the window layout
nmap <leader>bd :BD<cr>
" kill buffer from buff kill plugin
nmap <localleader>k :BK<cr>

"" Use CTRL-E to replace the original ',' mapping
nnoremap <C-E> ,

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

" remap gF
nnoremap <s-f> gF

" open file under cursor in new vim-tab
" nnoremap <leader>g<s-f> <c-w>gf
nnoremap g<s-f> <c-w>gf

" Include Time Stamps
nnoremap <F4> "=strftime("%Y-%m-%d")<CR>P
inoremap <F4> <C-R>=strftime("%Y-%m-%d")<CR>

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

if dein#tap('vimwiki')
  " nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
  nnoremap <silent> <Leader>WT :<C-u>VimwikiTabIndex<cr>
  nnoremap <c-s-left> @<Plug>VimwikiTableColumnLeft
  " nunmap <m-left>
  " unmap <m-Right>
endif

" move between split windows
noremap <s-m-Right> <esc><c-w>r
map <silent> <s-m-Left> <esc><c-w>r
map <silent> <m-Up> :wincmd k<CR>
map <silent> <m-Down> :wincmd j<CR>
map <silent> <m-Left> :wincmd h<CR>
map <silent> <m-Right> :wincmd l<CR>

nmap <silent> <c-Left> :tabprevious<cr>
nmap <silent> <c-Right> :tabnext<cr>


" Lower / Upper Case, Inital Upper Case And Toggle Case:
vnoremap ~ y:call setreg('', dway#misc#TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins specific mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle tagbar
" nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>tb :TagbarToggle<CR>

" vim-projectroot
nnoremap <silent><leader>pr :ProjectRootCD<cr>

" LimeLight
nmap ;ll :Limelight!!<cr>


" shell-vim
" open file explorere
" open files, url, ... (default map in vim-shell is F6)
nnoremap ge yiW:Open <cr>
" nnoremap <leader>ob yiW:Open <cr>
" nnoremap <leader>o :OpenBrowser <cr>
nmap fe <F6>
nmap ff <F6>
" gx from pandoc and netrw does the job for many things
" a good map candidate would also be <c-enter>

" Startify
nnoremap ;sf :Startify


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

" }}} key mappings

