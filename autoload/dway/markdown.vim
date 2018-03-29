
" {{{ SWITCH STATUS
" credit/source: https://github.com/gabrielelana/vim-markdown/blob/23e7da1a1266c40fa0d285437c310944a39f573d/autoload/markdown.vim
function! dway#markdown#SwitchStatus()
  let current_line = getline('.')
  if match(current_line, '^\s*[*\-+] \[ \]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[ \]', '\1 [x]', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \[x\]') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\) \[x\]', '\1', ''))
    return
  endif
  if match(current_line, '^\s*[*\-+] \(\[[x ]\]\)\@!') >= 0
    call setline('.', substitute(current_line, '^\(\s*[*\-+]\)', '\1 [ ]', ''))
    return
  endif
  if match(current_line, '^\s*#\{1,5}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*#\{1,5}\) \(.*$\)', '\1# \2', ''))
    return
  endif
  if match(current_line, '^\s*#\{6}\s') >= 0
    call setline('.', substitute(current_line, '^\(\s*\)#\{6} \(.*$\)', '\1# \2', ''))
    return
  endif
endfunction
" }}}
"

function! dway#markdown#OpenInBrowser(file)
  " expand('%:p') / expand('<cfile>')

  " let file = expand('%:p')
  let file = fnamemodify(resolve(expand(a:file)), ':p')
  let fname_core = fnamemodify(file, ':t:r')
  let file_path = fnamemodify(file, ':h')

  if has('unix')
    let html_folder = 'html/'
    let html_file = file_path."/".html_folder.fname_core.'.html'
    " Open html_file
    execute("!".g:cmd_default_browser." ".html_file)
  endif

endfunction

