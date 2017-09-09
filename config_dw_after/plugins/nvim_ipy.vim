
" https://github.com/bfredl/nvim-ipy
" <Plug>: https://stackoverflow.com/questions/18546533/execute-plug-commands-in-vim

if !g:dwc_ipython_terminal

   let g:nvim_ipy_perform_mappings = 0

   command! IPyMatplotFigsClose :call IPyRun('close("all")',1)<cr>
   command! IPyInterrupt :execute "normal \<Plug>(IPy-Interrupt)"
   command! IPyTerminate :execute "normal \<Plug>(IPy-Terminate)"

   map <silent> <c-s> <Plug>(IPy-Run)

   map <silent> <C-F> <Plug>(IPy-Complete)

   map <m-q> <Plug>(IPy-WordObjInfo)
endif
