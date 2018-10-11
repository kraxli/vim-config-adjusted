if ! exists('g:gui_oni')

	let g:dmisc_dcd_bin_dir='/home/dave/.dutils/dcd/bin/'

	" call dutyl#register#tool('dcd-client', g:dmisc_dcd_bin_dir.'dcd-client')
	" call dutyl#register#tool('dcd-server', g:dmisc_dcd_bin_dir.'dcd-server')
	" autocmd MyAutoCmd BufRead,BufEnter *.d DUDCDrestartServer
	
  let g:dutyl_stdImportPaths=['/snap/dmd/current/import/druntime', '/snap/dmd/31/import/phobos']

endif

augroup DlangAutoCmd
	" Note: au! ... will would delete all the previously set commands in the group DlangAutoCmd
	au!
	" ============================================
	" DFMT:
	" --------------------------------------------
	" Predefined dfmt:
	if executable('dfmt')
		au FileType d command! -nargs=* Dfmt :silent !dfmt %:p -i --indent_style=tab --indent_size=2 --max_line_length=100 --brace_style=stroustrup --space_after_cast=false  <f-args>

		" Customizable dfmt (set your own options):
		au FileType d command! -nargs=* DfmtC :silent !dfmt -i <f-args> %:p
		" autocmd MyAutoCmd FileType d nnoremap <silent><buffer> <c-d>f :Dfmt<cr>
	endif

	" ============================================
	" DFIX:
	" --------------------------------------------
	if executable('dfix')
		au  FileType d command! Dfix :silent !dfix %:p
	endif

	" ============================================
	" Misc:
	" --------------------------------------------

	au FileType d command! OpenDmdConf :e ~/dmd.conf
	" ['/snap/dmd/current/import/druntime', '/snap/dmd/31/import/phobos']
	au FileType d command! ExPhobos :V  /snap/dmd/31/import/phobos
	au FileType d command! ExRuntime :V  /snap/dmd/current/import/druntime
	au FileType d command! OpenPhobos :ExPhobos<cr>
	au FileType d command! OpenRuntime :ExRuntime<cr>


augroup END
