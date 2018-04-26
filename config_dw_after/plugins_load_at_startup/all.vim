
if dein#tap('ropevim')
    nmap Q :call RopeShowDoc()
    nmap Rd :call RopeGotoDefinition()
    map <c-c>rd :call RopeGotoDefinition()
endif
