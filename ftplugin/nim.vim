setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2
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
