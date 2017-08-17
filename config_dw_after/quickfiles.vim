if has("nvim")
 noremap <leader>ee :execute "tabnew ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>
  noremap <leader>uu :execute "source ".g:dway#base#path_config_nvim.g:dway#base#os_path_sep."init.vim"<cr>
else
  map <leader>ee :e C:\LocalData\Programs\Vim\_gvimrc<cr>      " edit my .vimrc file; <cr>: correspons to hit enter
  map <leader>uu :source C:\LocalData\Programs\Vim\_gvimrc<cr> " update the system settings from my vimrc file
  " set path+=/home/david/Dropbox/vimwiki
endif


