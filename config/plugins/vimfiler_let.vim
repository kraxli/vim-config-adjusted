" author: kraxli
" TODO: hmmm this file is at least called twice at startup???
"
" from SpaceVim: https://github.com/SpaceVim/SpaceVim/blob/dev/config/plugins/vimfiler.vim
"https://github.com/Shougo/vimfiler.vim/issues/344
scriptencoding utf-8
let g:vimfiler_as_default_explorer = 0

" let g:vimfiler_as_default_explorer = get(g:, 'vimfiler_as_default_explorer', 1)
let g:vimfiler_restore_alternate_file = get(g:, 'vimfiler_restore_alternate_file', 1)
let g:vimfiler_tree_indentation = get(g:, 'vimfiler_tree_indentation', 1)
let g:vimfiler_tree_leaf_icon = get(g:, 'vimfiler_tree_leaf_icon', '')
let g:vimfiler_tree_opened_icon = get(g:, 'vimfiler_tree_opened_icon', '▼')
let g:vimfiler_tree_closed_icon = get(g:, 'vimfiler_tree_closed_icon', '▷')
let g:vimfiler_file_icon = get(g:, 'vimfiler_file_icon', '')
let g:vimfiler_readonly_file_icon = get(g:, 'vimfiler_readonly_file_icon', '*')
let g:vimfiler_marked_file_icon = get(g:, 'vimfiler_marked_file_icon', '√')
"let g:vimfiler_preview_action = 'auto_preview'
let g:vimfiler_ignore_pattern = [
      \ '^\.git$',
      \ '^\.DS_Store$',
      \ '^\.init\.vim-rplugin\~$',
      \ '^\.netrwhist$',
      \ '\.class$'
      \]

if has('mac')
  let g:vimfiler_quick_look_command =
        \ '/Applications//Sublime\ Text.app/Contents/MacOS/Sublime\ Text'
else
  let g:vimfiler_quick_look_command = 'gloobus-preview'
endif

" vim:set et sw=2:
