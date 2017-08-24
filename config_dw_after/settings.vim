

" wrap lines
set wrap

" set line number when opening new buffer
au BufNewFile,BufRead,BufNew,BufEnter,BufWinEnter * set number

" Hide the mouse pointer while typing
set mousehide

if has ('nvim')
	set mouse=a mousemodel=popup_setpos " popup
endif
 

set noreadonly

