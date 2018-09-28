
" general approach to toggle stuff:
function! dway#misc#ToggleQuickFix()
  if exists("g:qwindow")
    cclose
    unlet g:qwindow
  else
    try
      copen "10
      let g:qwindow = 1
    catch
      echo "No Errors found!"
    endtry
  endif
endfunction
" nmap <script> <silent> <F2> :call dway#misc#ToggleQuickFix()<CR>
"
function! dway#misc#ToggleLocationList()
  if exists("g:qwindow")
    lclose
    unlet g:qwindow
  else
    try
      lopen "10
      let g:qwindow = 1
    catch
      echo "No Errors found!"
    endtry
  endif
endfunction


" !! put to plug folder or better auto ... in dway-vim-config
" relative line numbers: https://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
function! dway#misc#NumberToggle()
  if(&relativenumber == 1)
    set number
		set nornu
  else
    set relativenumber
  endif
endfunc



function! dway#misc#ToggleColorScheme(scheme1, scheme2)
   " let currentScheme = colorscheme
   " echo currentScheme
   if a:scheme1 == ''
    let scheme1='codedark'
   else
     let scheme1=a:scheme1
   end

   if a:scheme2 == ''
    let scheme2='PaperColor'
   else
     let scheme2=a:scheme2
   end

   if g:colors_name == scheme1
     execute 'colorscheme '.scheme2
   else
     execute 'colorscheme '.scheme1
   endif

   syntax on

endfunction


function! dway#misc#ToggleBgCs(scheme1, scheme2)
  " toggle background and colorscheme
  call dway#misc#ToggleColorScheme(a:scheme1, a:scheme2)
	execute 'set background='.(&background ==# 'dark' ? 'light' : 'dark')
endfunction

function! dway#misc#OpenExplorer(path)
  let path = expand(a:path)

  if has('unix')
    execute "!nautilus ".path
  else
    " ???
    execute "!explorer ".path
  endif

endfunction


function! dway#misc#OpenBrowser()
  let s:url = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')

  if s:url != ""
    if has('unix')
      execute "!firefox ".s:url
    else
      " ???
      execute "!google-chrome ".s:url
    endif

  else
    echo "No URI found in line."
  endif

endfunction


function! dway#misc#get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" Lower / Upper Case, Inital Upper Case And Toggle Case: Http://Stackoverflow.Com/Questions/17440659/Capitalize-First-Letter-Of-Each-Word-In-A-Selection-Using-Vim
function! dway#misc#TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
  " vnoremap <F7> u :s/\<./\u&/g<cr><Space> " :nohlsearch<Bar>:echo<CR>
  " vnoremap <F7> u :s/\<./\u&/g<cr> :nohlsearch<Bar>:echo<CR>
endfunction


" vim: foldmethod=marker
