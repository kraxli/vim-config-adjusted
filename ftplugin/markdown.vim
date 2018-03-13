
 au BufRead,BufNewFile *.md set filetype=pandoc
 au FileType pandoc,markdown setlocal spell spelllang=en,de
 au FileType pandoc,markdown setlocal foldlevel=0

