

function! Rformat() abort
	let line_number = lin(".")
	" s/,\(\d\)/, \1/g
	" s/\(=|*|/\)/ \1 /g
	

	execute "normal gg=G"
	execute "normal! ".line_number."G"	
endfunction

