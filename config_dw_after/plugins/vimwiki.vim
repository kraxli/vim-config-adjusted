
"""""""""""""
"  vimwiki  "
"""""""""""""
nnoremap <leader>li "='* [ ] '<cr>Pa

" let g:vimwiki_list = [{'path': '~/Dropbox/VimWiki/',
"                       \ 'path_html': '~/Dropbox/VimWiki/vimwiki_html',
"                       \ 'template_path': '~/Dropbox/VimWiki/templates',
"                       \ 'template_default': 'default',
"                       \ 'template_ext': '.html'}]

  let g:vimwiki_list = [
    \   { 'diary_header': 'Diary',
    \     'diary_link_fmt': '%Y-%m/%d',
    \     'auto_toc': 1,
    \     'path': '~/Dropbox/VimWiki/',
    \     'path_html': '~/Dropbox/VimWiki/vimwiki_html/',
    \     'template_path': '~/Dropbox/VimWiki/templates',
    \     'template_default': 'default',
    \     'template_ext': '.html'},
    \   { 'path': '~/docs/blog/',
    \     'syntax': 'markdown',
    \     'ext': '.md' }
    \ ]


" let g:vimwiki_list = [{'path': '~/Dropbox/VimWiki/',
                      " \ 'path_html': '~/Dropbox/VimWiki/vimwiki_html/'}]

" 'expr' " 'list'

nnoremap <Leader>ww <Plug>VimwikiIndex

let g:vimwiki_folding = 'custom'
let g:vimwiki_html_header_numbering = 1
let g:vimwiki_use_calendar = 1
let g:vimwiki_hl_cb_checked = 1
