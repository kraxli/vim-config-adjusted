

function! Rformat2()
	let line_number = line(".")
	execute 'silent %s/,\(\d\|[a-z,A-Z]\)/, \1/g'

	" execute '%s/\m\s*\(\~\|+\|=\|\/\)\s*/ \1 /g'
	execute '%s/\m\s*\(\~\|+\|\/\)\s*/ \1 /g'

	" execute  '%s/[^\#]\s*\(=\)\s*/ = /g'
	" execute  '%s/[^\#].*\zs\(\s*=\s*\)/ \1 /g'
	" execute  '%s/\(\#\)\@!.*\zs\s*\(=\)\s*/ \2 /g'
		" execute '%s/\(\#.*$\)\@<!\zs\s*\(=\)\s*/ \2 /g'
		" execute '%s/\(\(\#.*$\)\@!\zs\s*\(=\|-\)\s*/ \2 /g'
		" execute  'm/^\(\(#.*\)\@!.\)*$'
		" execute 's/\s*\(=\|-\)\s*\ze#/ \1 /g'
		execute '%s/\s*\(=\)\s*\ze#/ \1 /g'

	execute "normal! gg=G"
	execute "normal! ".line_number."G"
endfunction

" au FileType r command! Rformat2 :call Rformat2()


