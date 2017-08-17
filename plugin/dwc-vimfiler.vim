" TODO: hmmm this file is at least called twice at startup???     
"
" from SpaceVim: https://github.com/SpaceVim/SpaceVim/blob/dev/config/plugins/vimfiler.vim
"https://github.com/Shougo/vimfiler.vim/issues/344
scriptencoding utf-8
let g:vimfiler_as_default_explorer = 1

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
try
  call vimfiler#custom#profile('default', 'context', {
        \ 'explorer' : 1,
        \ 'winwidth' : g:spacevim_sidebar_width,
        \ 'winminwidth' : 30,
        \ 'toggle' : 1,
        \ 'auto_expand': 1,
        \ 'direction' : 'rightbelow',
        \ 'parent': 0,
        \ 'status' : 1,
        \ 'safe' : 0,
        \ 'split' : 1,
        \ 'hidden': 1,
        \ 'no_quit' : 1,
        \ 'force_hide' : 0,
        \ })
catch
endtry

augroup vfinit
  au!
  autocmd FileType vimfiler call s:vimfilerinit()
  autocmd BufEnter * if (winnr('$') == 1 && &filetype ==# 'vimfiler') |
        \ q | endif
augroup END

function! s:vimfilerinit()
  set nonumber
  set norelativenumber

  " silent! nunmap <buffer> <Space>
  silent! nunmap <buffer> <C-l>
  silent! nunmap <buffer> <C-j>
  " silent! nunmap <buffer> E
  silent! nunmap <buffer> gr
  silent! nunmap <buffer> gf
  silent! nunmap <buffer> -
  silent! nunmap <buffer> s

  nnoremap <silent><buffer> gr  :<C-u>Denite grep:<C-R>=<SID>selected()<CR> -buffer-name=grep<CR>
  nnoremap <silent><buffer> gf  :<C-u>Denite file_rec:<C-R>=<SID>selected()<CR><CR>
  nnoremap <silent><buffer> gd  :<C-u>call <SID>change_vim_current_dir()<CR>
  nnoremap <silent><buffer><expr> sg  vimfiler#do_action('vsplit')
  nnoremap <silent><buffer><expr> sv  vimfiler#do_action('split')
  nnoremap <silent><buffer><expr> st  vimfiler#do_action('tabswitch')
  nmap <buffer> gx     <Plug>(vimfiler_execute_vimfiler_associated)
  nmap <buffer> '      <Plug>(vimfiler_toggle_mark_current_line)
  nmap <buffer> v      <Plug>(vimfiler_quick_look)
  nmap <buffer> p      <Plug>(vimfiler_preview_file)
  nmap <buffer> V      <Plug>(vimfiler_clear_mark_all_lines)
  nmap <buffer> i      <Plug>(vimfiler_switch_to_history_directory)
  nmap <buffer> <Tab>  <Plug>(vimfiler_switch_to_other_window)
  nmap <buffer> <C-r>  <Plug>(vimfiler_redraw_screen)
  
  " dway adjustements
  nnoremap <silent><buffer><expr> t vimfiler#do_action('tabopen')

endf
 

" dway adjustements
command! -nargs=? Ex :VimFilerExplorer <args> -winminwidth=25 -winwidth=30
command! Eb :VimFilerBufferDir -explorer -winminwidth=25 -winwidth=30 
command! -nargs=?  -bar -complete=customlist,vimfiler#complete E :call VimFilerDway(<q-args>)
" command! Etab :tabnew|Explore %:p:h
" command! Ev :25Vex %:p:h " |vertical resize 25   

function! VimFilerDway(...)    
  let num_args = a:0 
    
  if num_args == 0 || a:1 == ''     
    VimFilerBufferDir -explorer -winminwidth=25 -winwidth=30 
  else   
    let folder = fnamemodify(expand(a:1), ':p:h')
    call vimfiler#init#_command({ 'explorer' : 1, }, folder.' -winminwidth=25 -winwidth=30')  
  endif

endfunction


 
" vim:set et sw=2:
