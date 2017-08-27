

" wrap lines
set wrap

" set line number when opening new buffer
au BufNewFile,BufRead,BufNew,BufEnter,BufWinEnter * set number

" Hide the mouse pointer while typing
set mousehide

set noreadonly

if has ('nvim')
	set mouse=a mousemodel=popup_setpos " popup
endif

if dein#tap('vimwiki')
	 " nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
	 nnoremap <silent> <Leader>WT :<C-u>VimwikiTabIndex<cr>
endif

" https://www.gregjs.com/vim/2015/lint-as-you-type-with-neovim-and-neomake/
" You can set the amount of undos to remember with set undolevels=X (default is 1000) and of course you can set the undodir to anything you want, but make sure the directory exists! Read :h undo-persistence to learn more.
set undodir=~/.config/nvim/undodir
set undofile
