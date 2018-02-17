
" Key-mappings
"---------------------------------------------------------

if dwc_key_maps

  nmap <leader>tb :TagbarToggle<CR>
  nmap <leader>t :TagbarToggle<CR>

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
