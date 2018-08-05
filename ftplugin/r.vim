

" not really required as nvim-r provides such a functionality 
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

" https://stackoverflow.com/questions/4794859/exuberant-ctags-with-r
" command! -nargs=? Rtags :!Rscript -e 'rtags(path="'.<q-args>.'", recursive=TRUE, ofile="RTAGS")' -e 'etags2ctags("RTAGS", "rtags")' -e 'unlink("RTAGS")'
" set tags+=rtags

