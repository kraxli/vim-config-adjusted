
if exists(':Startify') == 2
	Startify
	if isdirectory(bufname(1))
		bwipeout! 1
	endif
	if exists(':IndentLinesDisable')
		IndentLinesDisable
	endif
endif

