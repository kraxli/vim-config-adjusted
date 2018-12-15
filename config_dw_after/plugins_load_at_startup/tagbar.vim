
" {{{ TODO: === Tags === 


""""""""""""""""""""""""""""""
"  Tagbar - exuberant ctags  "
""""""""""""""""""""""""""""""
" http://blog.adamdklein.com/?p=28
" https://majutsushi.github.io/tagbar/
" Tagbar-Wiki: https://github.com/majutsushi/tagbar/wiki
" Tagbar-Wiki (dlang): https://github.com/majutsushi/tagbar/wiki#d
let g:tagbar_width = 25


" https://github.com/majutsushi/tagbar/issues/99
" set noshelltemp
" set shell=/bin/sh

" " settings for D  in autoload/tagbar.vim:
" D
" let type_d = s:TypeInfo.New()
" let type_d.ctagstype = 'd'
" let type_d.kinds = [
" \ {'short' : 'M', 'long' : 'module', 'fold' : 0, 'stl' : 0},

" " tagbar/wiki:
" let g:tagbar_type_d = {
"             \ 'ctagstype' : 'd',
"             \ 'kinds'     : [
"             \ 'c:classes:1:1',
"             \ 'f:functions:1:1',
"             \ 'T:template:1:1',
"             \ 'g:enums:1:1',
"             \ 'e:enumerators:0:0',
"             \ 'u:unions:1:1',
"             \ 's:structs:1:1',
"             \ 'v:variables:1:0',
"             \ 'i:interfaces:1:1',
"             \ 'm:members',
"             \ 'a:alias'
"             \ ],
"             \'sro': '.',
"             \ 'kind2scope' : {
"             \ 'c' : 'class',
"             \ 'g' : 'enum',
"             \ 's' : 'struct',
"             \ 'u' : 'union',
"             \ 'i' : 'interface',
"             \ 'T' : 'template'
"             \},
"             \ 'scope2kind' : {
"             \ 'enum'      : 'g',
"             \ 'class'     : 'c',
"             \ 'struct'    : 's',
"             \ 'union'     : 'u',
"             \ 'interface' : 'i',
"             \ 'template'  : 'T'
"             \ },
"             \ 'ctagsbin' : '/home/dave/.dutils/Dscanner/bin/dscanner',
"             \ 'ctagsargs' : ['--ctags']
"             \ }

            " \ 'M:module',
            " \ 'X:mixins',
            " \ 't:typedefs',
            " \ 'x:external:0:0',
            " \ 'l:local:0:0'

            " \ 'ctagsbin' : '/home/dave/.dutils/Dscanner/bin/dscanner',
            " \ 'ctagsargs' : ['--ctags']
            " \ 'ctagsbin' : '/usr/local/bin/ctags'

" https://github.com/dbordak/dotfiles/blob/master/.tagbar-d.vim
" https://github.com/majutsushi/tagbar/wiki#r
" ctags --list-kinds=d
" let g:tagbar_type_d = {
" 	\ 'ctagstype' : 'd',
" 	\ 'kinds'     : [
" 		\ 'M:module',
" 		\ 'X:mixins',
" 		\ 'T:templates:1',
" 		\ 't:typedefs',
" 		\ 'g:enums',
" 		\ 'e:enumerators',
" 		\ 'c:classes:0:1',
" 		\ 's:structs',
" 		\ 'u:unions',
" 		\ 'm:members',
"     \ 'v:variables',
" 		\ 'f:functions',
"     \ 'x:external'
" 	\ ],
" 	\ 'sro' : '.',
" 	\ 'kind2scope' : {
" 		\ 'g' : 'enum',
" 		\ 'T' : 'template',
" 		\ 'c' : 'class',
" 		\ 's' : 'struct',
" 		\ 'u' : 'union'
" 	\ },
" 	\ 'scope2kind' : {
" 		\ 'enum' : 'g',
" 		\ 'template' : 'T',
" 		\ 'class' : 'c',
" 		\ 'struct' : 's',
" 		\ 'union' : 'u'
" 	\ },
"      \ 'ctagsbin' : 'ctags'
"  \ }
"
" 		" \ 'i:interfaces',
"     " \ 'l:local'
"     " \ 'ctagsbin' : '/usr/local/bin/ctags'
"
"     " \ 'ctagsbin' : '/home/dave/.dutils/Dscanner/bin/dscanner',
"     " \ 'ctagsargs' : ['--ctags']
"     " \ 'ctagsbin' : 'ctags',
"     "  /usr/local/bin/ctags (with ctags-d)


" DSCANNER TAGBAR HACK
" let g:tagbar_type_d = {
"     \ 'ctagstype' : 'd',
"     \ 'kinds'     : [
"     \ 'c:classes:1:1',
"     \ 'f:functions:1:1',
"     \ 'T:template:1:1',
"     \ 'g:enums:1:1',
"     \ 'e:enumerators:0:0',
"     \ 'u:unions:1:1',
"     \ 's:structs:1:1',
"     \ 'v:variables:1:0',
"     \ 'i:interfaces:1:1',
"     \ 'm:members',
"     \ 'a:alias'
"     \ ],
"     \'sro': '.',
"     \ 'kind2scope' : {
"     \ 'c' : 'class',
"     \ 'g' : 'enum',
"     \ 's' : 'struct',
"     \ 'u' : 'union',
"     \ 'T' : 'template'
"     \},
"     \ 'scope2kind' : {
"     \ 'enum'      : 'g',
"     \ 'class'     : 'c',
"     \ 'struct'    : 's',
"     \ 'union'     : 'u',
"     \ 'template'  : 'T'
"     \ },
"     \ 'ctagsbin' : 'dscanner',
"     \ 'ctagsargs' : ['--ctags']
"     \ }

" let g:tagbar_type_pdc


" {{{ pandoc
" https://unix.stackexchange.com/questions/285325/how-to-match-markdown-setext-headers-in-in-exuberant-ctags
" https://github.com/vim-scripts/Tagbar/blob/master/doc/tagbar.txt
" see: ~/.ctags file

let g:tagbar_type_pandoc = {
    \ 'ctagstype' : 'pandoc',
    \ 'kinds'     : [
        \ 'h:headers',
        \ 'g:graphics:0:0',
        \ 'l:labels',
        \ 'r:refs:1:0',
        \ 'p:pagerefs:1:0'
    \ ],
    \ 'sort'    : 0,
     \ }
"}}} pandoc


let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
\ }


let g:tagbar_type_markdown = {
           \ 'ctagstype': 'markdown',
           \ 'ctagsbin' :  '/usr/local/bin/markdown2ctags',
           \ 'ctagsargs' : '-f - --sort=yes',
           \ 'kinds' : [
               \ 's:sections',
               \ 'i:images'
           \ ],
           \ 'sro' : '|',
           \ 'kind2scope' : {
               \ 's' : 'section',
           \ },
           \ 'sort': 0,
       \ }


let g:tagbar_type_vimwiki = g:tagbar_type_markdown

" }}} Tags

