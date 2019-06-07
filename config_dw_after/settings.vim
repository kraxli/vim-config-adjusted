
" wrap lines
" set wrap
set nowrap

" set line number when opening new buffer
au BufNewFile,BufRead,BufNew,BufEnter,BufWinEnter * set number

" Hide the mouse pointer while typing
set mousehide

set noreadonly

if has ('nvim')
	set mouse=a mousemodel=popup_setpos " popup
endif

" https://www.gregjs.com/vim/2015/lint-as-you-type-with-neovim-and-neomake/
" You can set the amount of undos to remember with set undolevels=X (default is 1000) and of course you can set the undodir to anything you want, but make sure the directory exists! Read :h undo-persistence to learn more.
set undodir=~/.config/nvim/undodir
set undofile

" do not set readonly
" set noro

" Color Scheme
" colorscheme hybrid " gruvbox  hybrid
" set background=light " dark

" let color_scheme1 = 'hybrid'
" let color_scheme2 = 'gruvbox'

" Status bar/line: full path in statusline
" set statusline+=%F
" set statusline=%F

" set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ \[%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ %=\ Line:%l\/%L\ Column:%c%V\ %P
" set statusline=
" set statusline +=%1*\ %n\ %*            "buffer number
" set statusline +=%5*%{&ff}%*            "file format
" set statusline +=%3*%y%*                "file type
" set statusline +=%4*\ %<%F%*            "full path
" set statusline +=%2*%m%*                "modified flag
" set statusline +=%1*%=%5l%*             "current line
" set statusline +=%2*/%L%*               "total lines
" set statusline +=%1*%4v\ %*             "virtual column number
" set statusline +=%2*0x%04B\ %*          "character under cursor

set breakindent
" let &showbreak=' '

if executable('ag')
	set grepprg=ag
endif
