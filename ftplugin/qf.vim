" Snippets from vim-qf
" Credits: https://github.com/romainl/vim-qf

if exists('b:did_ftplugin')
	finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpoptions
set cpoptions&vim

let b:undo_ftplugin = 'setl fo< com< ofu<'

setlocal winminheight=1 winheight=3
setlocal wrap
setlocal textwidth=9999
setlocal norelativenumber number
setlocal linebreak
setlocal nolinebreak
setlocal nolist
setlocal cursorline
setlocal nobuflisted
" setlocal wrapmargin=9999

wincmd J

nnoremap <buffer> <CR> <CR><C-w>p
nnoremap <buffer> sv   <C-w><CR>
nnoremap <buffer> sg   <C-w><Enter><C-w>L
nnoremap <buffer> st   <C-w><CR><C-w>T
nnoremap <silent><buffer> p  :call <SID>preview_file()<CR>
" nnoremap <silent><buffer> q  :pclose!<CR>:quit<CR>
nnoremap <buffer> o    <CR><C-w>p

nnoremap <space> :copen<cr>

let b:qf_isLoc = ! empty(getloclist(0))
if b:qf_isLoc == 1
	nnoremap <buffer> 00 <CR>:lclose<CR>

	" kraxli: vim-config-adjusted
	nnoremap <buffer> <c-j> :lnext<cr>
	nnoremap <buffer> <c-k> :lprevious<cr>
	nnoremap <space> :lopen<cr>
else
	nnoremap <buffer> 00 <CR>:cclose<CR>

	" kraxli: vim-config-adjusted
	nnoremap <buffer> <c-j> :cnext<cr>
	nnoremap <buffer> <c-k> :cprevious<cr>
	" :au BufWinEnter quickfix nmap <buffer> <Enter> :.cc | wincmd p<CR>
	nnoremap <space> :copen<cr>
endif

function! s:preview_file()
	let winwidth = &columns
	let cur_list = b:qf_isLoc == 1 ? getloclist('.') : getqflist()
	let cur_line = getline(line('.'))
	let cur_file = fnameescape(substitute(cur_line, '|.*$', '', ''))
	if cur_line =~# '|\d\+'
		let cur_pos  = substitute(cur_line, '^\(.\{-}|\)\(\d\+\)\(.*\)', '\2', '')
		execute 'vertical pedit! +'.cur_pos.' '.cur_file
	else
		execute 'vertical pedit! '.cur_file
	endif
	wincmd P
	execute 'vert resize '.(winwidth / 2)
	wincmd p
endfunction

let &cpoptions = s:save_cpo
