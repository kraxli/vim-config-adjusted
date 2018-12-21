setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=80
setlocal expandtab
setlocal smarttab

setlocal nosmartindent
set foldmethod=indent
setl foldcolumn=2


augroup NimlangAutoCmd
	au!

	" Comment string to use in tpope/vim-commentary
	autocmd FileType nim setlocal commentstring=#\ %s

augroup END

au FileType nim command! Run :!nim compile --run %
au FileType nim map <F5> :Run<cr>
