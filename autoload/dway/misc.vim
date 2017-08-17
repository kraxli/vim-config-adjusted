

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
 


function! dway#misc#ToogleColorScheme(scheme1, scheme2)
   " let currentScheme = colorscheme
   " echo currentScheme 
   if a:scheme1 == ''
    let scheme1='mustang'
   else 
     let scheme1=a:scheme1
   end

   if a:scheme2 == ''
    let scheme2='solarized'
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
 
"vim:foldmethod="marker"
