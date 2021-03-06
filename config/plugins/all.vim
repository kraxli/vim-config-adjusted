
" Plugin Settings
"---------------------------------------------------------

if dein#tap('denite.nvim')
	nnoremap <silent><LocalLeader>tw :<C-u>Denite task<cr>
	nnoremap <silent><LocalLeader>df :<C-u>Denite file/rec<CR>
	nnoremap <silent><LocalLeader>db :<C-u>Denite buffer file/old -default-action=switch<CR>
	nnoremap <silent><LocalLeader>r :<C-u>Denite -resume -refresh -no-start-filter<CR>
	nnoremap <silent><LocalLeader>d :<C-u>Denite directory_rec -default-action=cd<CR>
	nnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register<CR>
	xnoremap <silent><LocalLeader>v :<C-u>Denite neoyank -buffer-name=register -default-action=replace<CR>
	nnoremap <silent><LocalLeader>l :<C-u>Denite location_list -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>q :<C-u>Denite quickfix -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>n :<C-u>Denite dein<CR>
	nnoremap <silent><LocalLeader>dg :<C-u>Denite grep -buffer-name=search<CR>
	nnoremap <silent><LocalLeader>j :<C-u>Denite jump change file/point -buffer-name=jump<CR>
	nnoremap <silent><LocalLeader>u :<C-u>Denite junkfile:new junkfile<CR>
	nnoremap <silent><LocalLeader>o :<C-u>Denite outline<CR>
	nnoremap <silent><LocalLeader>s :<C-u>Denite session -buffer-name=list<CR>
	nnoremap <silent><LocalLeader>t :<C-u>Denite -buffer-name=tag tag:include<CR>
	nnoremap <silent><LocalLeader>p :<C-u>Denite jump -buffer-name=jump<CR>
	nnoremap <silent><LocalLeader>h :<C-u>Denite help<CR>
	nnoremap <silent><LocalLeader>m :<C-u>Denite file/rec -buffer-name=memo -path=~/docs/books<CR>
	" nnoremap <silent><LocalLeader>m :<C-u>Denite mpc -buffer-name=mpc<CR>
	nnoremap <silent><LocalLeader>z :<C-u>Denite z<CR>
	nnoremap <silent><LocalLeader>/ :<C-u>Denite line -start-filter<CR>
	nnoremap <silent><LocalLeader>* :<C-u>DeniteCursorWord line<CR>
	nnoremap <silent><LocalLeader>; :<C-u>Denite command command_history<CR>

	" chemzqm/denite-git
	" nnoremap <silent> <Leader>gl :<C-u>Denite gitlog:all -buffer-name=git<CR>
	" nnoremap <silent> <Leader>gs :<C-u>Denite gitstatus -buffer-name=git<CR>
	nnoremap <silent> <Leader>gbr :<C-u>Denite gitbranch -buffer-name=git<CR>

	" Open Denite with word under cursor or selection
	nnoremap <silent> <Leader>gt :DeniteCursorWord tag:include -buffer-name=tag -immediately<CR>
	nnoremap <silent> <Leader>gf :DeniteCursorWord file/rec<CR>
	nnoremap <silent> <Leader>gg :DeniteCursorWord grep -buffer-name=search<CR>
	vnoremap <silent> <Leader>gg
		\ :<C-u>call <SID>get_selection('/')<CR>
		\ :execute 'Denite -buffer-name=search grep:::'.@/<CR><CR>

	function! s:get_selection(cmdtype)
		let temp = @s
		normal! gv"sy
		let @/ = substitute(escape(@s, '\'.a:cmdtype), '\n', '\\n', 'g')
		let @s = temp
	endfunction "}}}

	" kraxli:
	" search This file
	command! -nargs=1 GrepBuffer :vimgrep <q-args> % | :Denite quickfix -buffer-name=list<CR>
	command! -nargs=1 GrepFile :GrepBuffer <args>
	" nmap <localleader>gv :GrepBuffer<space> " grep view (open file / buffer)

endif

" kraxli:
if dein#tap('fzf.vim')
	nnoremap <silent><LocalLeader>g :<C-U>Ag<cr>

	nnoremap <silent><LocalLeader>b :Buffers<CR>
	nnoremap <silent><localleader>s :Snippets<cr>
	nnoremap <silent><c-s> :Snippets<cr>
	imap <silent><c-s> <esc><c-s>

	" FzF ctrl-t
	nnoremap <silent><localleader>f :Files .<cr>
	nnoremap <silent><localleader>hf :History<cr>
	nnoremap <silent><localleader>hc :History:<cr>
	nnoremap <silent><localleader>hs :History/:<cr>
	" FzF: ctrl-r
	nmap <localleader>c :Commands<cr>
	nmap <silent> <Leader>gl :Commits<CR>
	nmap <silent> <Leader>gs :GFiles?<CR>

	imap <c-x><c-w> <plug>(fzf-complete-word)
	" inoremap <expr> <c-x><c-w> fzf#vim#complete('cat /usr/share/dict/words')
	imap <c-x><c-p> <plug>(fzf-complete-path)
	imap <c-x><c-j> <plug>(fzf-complete-file-ag)
	imap <c-x><c-l> <plug>(fzf-complete-line)

	nmap <localleader>k <plug>(fzf-maps-n)
	xmap <localleader>k <plug>(fzf-maps-x)
	omap <localleader>k <plug>(fzf-maps-o)

	augroup fzfQuickfixWindow
		autocmd! fzfQuickfixWindow
		au FileType fzf nmap <buffer> <silent> q :q<cr> " <buffer> for buffer local
		au FileType fzf nmap <buffer> <silent> jj <esc> " <buffer> for buffer local
		" au BufLeave fzf unmap q
	augroup end

	" nnoremap <silent> <Leader>gc :<C-u>Denite gitbranch<CR>
endif

if dein#tap('vim-denite-z')
	command! -nargs=+ -complete=file Z
		\ call denite#start([{'name': 'z', 'args': [<q-args>], {'immediately': 1}}])
endif

if dein#tap('tagbar')
	nnoremap <silent> <Leader>o   :<C-u>TagbarOpenAutoClose<CR>

	" Also use h/l to open/close folds
	let g:tagbar_map_closefold = ['h', '-', 'zc']
	let g:tagbar_map_openfold = ['l', '+', 'zo']
endif

if dein#tap('defx.nvim')
	nnoremap <silent> <LocalLeader>e
		\ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
	nnoremap <silent> <LocalLeader>a
		\ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<CR>
endif

if dein#tap('nerdtree')
	let g:NERDTreeMapOpenSplit = 'sv'
	let g:NERDTreeMapOpenVSplit = 'sg'
	let g:NERDTreeMapOpenInTab = 'st'
	let g:NERDTreeMapOpenInTabSilent = 'sT'
	let g:NERDTreeMapUpdirKeepOpen = '<BS>'
	let g:NERDTreeMapOpenRecursively = 't'
	let g:NERDTreeMapCloseChildren = 'T'
	let g:NERDTreeMapToggleHidden = '.'

	nnoremap <silent> <Leader>e :<C-u>let NERDTreeWinPos=0 \| NERDTreeToggle<CR>
	" nnoremap <silent> <LocalLeader>a :<C-u>let NERDTreeWinPos=0 \| NERDTreeFind<CR>
	" nnoremap <silent> <LocalLeader>E :<C-u>let NERDTreeWinPos=1 \| NERDTreeToggle<CR>
	" nnoremap <silent> <LocalLeader>A :<C-u>let NERDTreeWinPos=1 \| NERDTreeFind<CR>
endif

if dein#tap('vimfiler.vim')

	function! VimFilerFileDway(...)
		let num_args = a:0

		if num_args == 0 || a:1 == ''
			VimFilerBufferDir -explorer -winminwidth=25 -winwidth=30
		else
			let folder = fnamemodify(expand(a:1), ':p:h')
			call vimfiler#init#_command({ 'explorer' : 1, }, folder.' -winminwidth=25 -winwidth=30')
		endif
	endfunction

	nnoremap <silent> <localleader>e  :<C-u>VimFilerCurrentDir -explorer -winminwidth=25 -winwidth=30 -toggle<cr>
	" "-buffer-name=explorer -no-quit -split -winwidth=30 -toggle<CR>

	nnoremap <silent> <localleader>a :call VimFilerFileDway()<cr>
	" nnoremap <silent> <localleader>a  :<C-u>VimFilerBufferDir -buffer-name=explorer -no-quit -split -winwidth=30 -toggle<CR>

	command! -nargs=?  -bar -complete=file V :call VimFilerFileDway(<q-args>)
	" command! Ev :25Vex %:p:h " |vertical resize 25
	" dway adjustements
	command! -nargs=? Vf :VimFilerExplorer <args> -winminwidth=25 -winwidth=30
	command! Vb :VimFilerBufferDir -explorer -winminwidth=25 -winwidth=30
	" command! -nargs=?  -bar -complete=customlist,vimfiler#complete E :call VimFilerFileDway(<q-args>)
endif


if dein#tap('neosnippet.vim')
	imap <expr><C-o> neosnippet#expandable_or_jumpable()
		\ ? "\<Plug>(neosnippet_expand_or_jump)" : "\<ESC>o"
	xmap <silent><C-s> <Plug>(neosnippet_register_oneshot_snippet)
	smap <silent>L     <Plug>(neosnippet_jump_or_expand)
	xmap <silent>L     <Plug>(neosnippet_expand_target)
endif

if dein#tap('ultisnips')
	inoremap <silent> <C-o> <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>
	" inoremap <silent> <C-CR> <C-R>=UltiSnips#ExpandSnippetOrJump()<cr>
	" imap <expr><C-CR> UltiSnips#ExpandSnippet()
endif

if dein#tap('emmet-vim')
	autocmd MyAutoCmd FileType html,css,jsx,javascript,javascript.jsx
		\ EmmetInstall
		\ | imap <buffer> <C-Return> <Plug>(emmet-expand-abbr)
endif

if dein#tap('vim-operator-surround')
	map <silent>sa <Plug>(operator-surround-append)
	map <silent>sd <Plug>(operator-surround-delete)
	map <silent>sr <Plug>(operator-surround-replace)
	nmap <silent>sma <Plug>(operator-surround-append)<Plug>(textobj-multiblock-i)
	nmap <silent>smd <Plug>(operator-surround-delete)<Plug>(textobj-multiblock-a)
	nmap <silent>smr <Plug>(operator-surround-replace)<Plug>(textobj-multiblock-a)
endif

if dein#tap('vim-operator-replace')
	xmap p <Plug>(operator-replace)
endif

if dein#tap('vim-operator-flashy')
	map y <Plug>(operator-flashy)
	nmap Y <Plug>(operator-flashy)$
endif

if dein#tap('vim-niceblock')
	xmap I  <Plug>(niceblock-I)
	xmap A  <Plug>(niceblock-A)
endif

if dein#tap('accelerated-jk')
	nmap <silent>j <Plug>(accelerated_jk_gj)
	nmap <silent>k <Plug>(accelerated_jk_gk)
endif

" kraxli: vim-config-adjusted
if dein#tap('indentLine')
	nmap <silent><Leader>ti :<C-u>IndentLinesToggle<CR>
elseif dein#tap('vim-indent-guides')
	nmap <silent><Leader>ti :<C-u>IndentGuidesToggle<CR>
endif

if dein#tap('vim-edgemotion')
	map gj <Plug>(edgemotion-j)
	map gk <Plug>(edgemotion-k)
	xmap gj <Plug>(edgemotion-j)
	xmap gk <Plug>(edgemotion-k)
endif

if dein#tap('vim-quickhl')
	nmap <Leader>; <Plug>(quickhl-manual-reset)
	xmap <Leader>; <Plug>(quickhl-manual-reset)
	nmap mt <Plug>(quickhl-manual-this)
	xmap mt <Plug>(quickhl-manual-this)
endif

if dein#tap('vim-sidemenu')
	nmap <Leader>l <Plug>(sidemenu)
	xmap <Leader>l <Plug>(sidemenu-visual)
endif

if dein#tap('vim-bookmarks')
	nmap ma :<C-u>cgetexpr bm#location_list()<CR>
		\ :<C-u>Denite quickfix -buffer-name=list<CR>
	nmap mn <Plug>BookmarkNext
	nmap mp <Plug>BookmarkPrev
	nmap mm <Plug>BookmarkToggle
	nmap mi <Plug>BookmarkAnnotate
endif

if dein#tap('auto-git-diff')
	autocmd MyAutoCmd FileType gitrebase
		\  nmap <buffer><CR>  <Plug>(auto_git_diff_scroll_manual_update)
		\| nmap <buffer><C-n> <Plug>(auto_git_diff_scroll_down_page)
		\| nmap <buffer><C-p> <Plug>(auto_git_diff_scroll_up_page)
		\| nmap <buffer><C-d> <Plug>(auto_git_diff_scroll_down_half)
		\| nmap <buffer><C-u> <Plug>(auto_git_diff_scroll_up_half)
endif

if dein#tap('committia.vim')
	let g:committia_hooks = {}
	function! g:committia_hooks.edit_open(info)
		imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
		imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

		setlocal winminheight=1 winheight=1
		resize 10
		startinsert
	endfunction
endif

if dein#tap('python_match.vim')
	" kraxli (comment two lines)
	" nmap <buffer> {{ [%
	" nmap <buffer> }} ]%
endif

if dein#tap('goyo.vim')
	nnoremap <Leader>G :Goyo<CR>
endif

if dein#tap('vimwiki')
	" nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
	nnoremap <c-s-left> @<Plug>VimwikiTableColumnLeft
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
	" nnoremap <silent> <leader>ww :<C-u>VimwikiIndex<CR>
	nnoremap <silent> <Leader>W :<C-u>VimwikiIndex<CR>
	" nnoremap <silent> <leader>wt :<C-u>VimwikiTabIndex<cr>
	nnoremap <silent> <Leader>WT :<C-u>VimwikiTabIndex<cr>
endif

if dein#tap('vim-choosewin')
	nmap -         <Plug>(choosewin)
	nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>
endif

if dein#tap('jedi-vim')
	let g:jedi#completions_command = '<c-space>'
	let g:jedi#documentation_command = 'K'
	" let g:jedi#goto_command = '<C-]>'
	let g:jedi#goto_command = 'gd'
	let g:jedi#goto_assignments_command = '<leader>g'
	let g:jedi#rename_command = '<Leader>jr'
	let g:jedi#usages_command = '<Leader>ju'
endif

if dein#tap('tern_for_vim')
	autocmd MyAutoCmd FileType javascript,jsx,javascript.jsx
		\  nnoremap <silent><buffer> K          :<C-u>TernDoc<CR>
		\| nnoremap <silent><buffer> <C-]>      :<C-u>TernDefSplit<CR>
		\| nnoremap <silent><buffer> <leader>g  :<C-u>TernType<CR>
		\| nnoremap <silent><buffer> <leader>n  :<C-u>TernRefs<CR>
		\| nnoremap <silent><buffer> <leader>r  :<C-u>TernRename<CR>
endif

if dein#tap('vim-gitgutter')
	nmap <Leader>hj <Plug>GitGutterNextHunk
	nmap <Leader>hk <Plug>GitGutterPrevHunk
	nmap <Leader>hs <Plug>GitGutterStageHunk
	nmap <Leader>hr <Plug>GitGutterUndoHunk
	nmap <Leader>hp <Plug>GitGutterPreviewHunk
endif

if dein#tap('vim-go')
	autocmd MyAutoCmd FileType go
		\   nmap <C-]> <Plug>(go-def)
		\ | nmap <Leader>god  <Plug>(go-describe)
		\ | nmap <Leader>goc  <Plug>(go-callees)
		\ | nmap <Leader>goC  <Plug>(go-callers)
		\ | nmap <Leader>goi  <Plug>(go-info)
		\ | nmap <Leader>gom  <Plug>(go-implements)
		\ | nmap <Leader>gos  <Plug>(go-callstack)
		\ | nmap <Leader>goe  <Plug>(go-referrers)
		\ | nmap <Leader>gor  <Plug>(go-run)
		\ | nmap <Leader>gov  <Plug>(go-vet)
endif

if dein#tap('phpcomplete-extended')
	autocmd MyAutoCmd FileType php
		\   nmap <silent> <unique> K <Plug>(phpcomplete-extended-doc)
		\ | nmap <silent> <unique> <C-]> <Plug>(phpcomplete-extended-goto)
		\ | nmap <silent> <unique> <Leader>a <Plug>(phpcomplete-extended-add-use)
endif

if dein#tap('vimagit')
	nnoremap <silent> mg :Magit<CR>
endif

if dein#tap('vim-easygit')
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gD :Gdiffoff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gbl :Gblame<CR>
	nnoremap <silent> <leader>gB :Gbrowse<CR>
	nnoremap <silent> <leader>gS :Gstatus<CR>
	nnoremap <silent> <leader>gp :Gpush<CR>
endif

if dein#tap('vim-altr')
	nmap <leader>n  <Plug>(altr-forward)
	nmap <leader>N  <Plug>(altr-back)
endif

if dein#tap('open-browser.vim')
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
endif

if dein#tap('undotree')
	nnoremap <Leader>gu :UndotreeToggle<CR>
endif

if dein#tap('vim-online-thesaurus')
	nnoremap <silent> <Leader>K :<C-u>OnlineThesaurusCurrentWord<CR>
endif

if dein#tap('vim-asterisk')
	map *   <Plug>(asterisk-g*)
	map g*  <Plug>(asterisk-*)
	map #   <Plug>(asterisk-g#)
	map g#  <Plug>(asterisk-#)

	map z*  <Plug>(asterisk-z*)
	map gz* <Plug>(asterisk-gz*)
	map z#  <Plug>(asterisk-z#)
	map gz# <Plug>(asterisk-gz#)
endif

if dein#tap('vim-expand-region')
	xmap v <Plug>(expand_region_expand)
	xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('sideways.vim')
	nnoremap <silent> m" :SidewaysJumpLeft<CR>
	nnoremap <silent> m' :SidewaysJumpRight<CR>
	omap <silent> a, <Plug>SidewaysArgumentTextobjA
	xmap <silent> a, <Plug>SidewaysArgumentTextobjA
	omap <silent> i, <Plug>SidewaysArgumentTextobjI
	xmap <silent> i, <Plug>SidewaysArgumentTextobjI
endif

if dein#tap('splitjoin.vim')
	let g:splitjoin_join_mapping = ''
	let g:splitjoin_split_mapping = ''
	nmap sj :SplitjoinJoin<CR>
	nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('linediff.vim')
	vnoremap mdf :Linediff<CR>
	vnoremap mda :LinediffAdd<CR>
	nnoremap mds :<C-u>LinediffShow<CR>
	nnoremap mdr :<C-u>LinediffReset<CR>
endif

if dein#tap('dsf.vim')
	nmap dsf <Plug>DsfDelete
	nmap csf <Plug>DsfChange
endif

" if dein#tap('caw.vim')
" 	function! InitCaw() abort
" 		if ! &l:modifiable
" 			silent! nunmap <buffer> <Leader>V
" 			silent! xunmap <buffer> <Leader>V
" 			silent! nunmap <buffer> <Leader>v
" 			silent! xunmap <buffer> <Leader>v
" 			silent! nunmap <buffer> gc
" 			silent! xunmap <buffer> gc
" 			silent! nunmap <buffer> gcc
" 			silent! xunmap <buffer> gcc
" 		else
" 			xmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
" 			nmap <buffer> <Leader>V <Plug>(caw:wrap:toggle)
" 			xmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
" 			nmap <buffer> <Leader>v <Plug>(caw:hatpos:toggle)
" 			nmap <buffer> gc <Plug>(caw:prefix)
" 			xmap <buffer> gc <Plug>(caw:prefix)
" 			nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
" 			xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
" 		endif
" 	endfunction
" 	autocmd MyAutoCmd FileType * call InitCaw()
" 	call InitCaw()
" endif

if dein#tap('vim-easymotion')
	" letter e would be free!
	nmap ss <Plug>(easymotion-s2)
	nmap sd <Plug>(easymotion-s)
	nmap sf <Plug>(easymotion-overwin-f)
	map  sh <Plug>(easymotion-linebackward)
	map  sl <Plug>(easymotion-lineforward)
	" map  sj <Plug>(easymotion-j)
	" map  sk <Plug>(easymotion-k)
	map  s/ <Plug>(easymotion-sn)
	omap s/ <Plug>(easymotion-tn)
	map  sn <Plug>(easymotion-next)
	map  sp <Plug>(easymotion-prev)
endif

if dein#tap('vim-textobj-multiblock')
	omap <silent> ab <Plug>(textobj-multiblock-a)
	omap <silent> ib <Plug>(textobj-multiblock-i)
	xmap <silent> ab <Plug>(textobj-multiblock-a)
	xmap <silent> ib <Plug>(textobj-multiblock-i)
endif

if dein#tap('vim-textobj-function')
	omap <silent> af <Plug>(textobj-function-a)
	omap <silent> if <Plug>(textobj-function-i)
	xmap <silent> af <Plug>(textobj-function-a)
	xmap <silent> if <Plug>(textobj-function-i)
endif

" kraxli
if dein#tap('vim-bufkill')
	"" Use the bufkill plugin to eliminate a buffer but keep the window layout
	nmap bd :BD<cr>
	nmap <leader>bd :BD\|hide<cr>
endif

if dein#tap('nvim-R')
	augroup RCmd
		au!
		au FileType R command! RStart :call StartR("R")
		au FileType R command! RCustomStart :call StartR("custom")
	augroup END
endif

if dein#tap('vim-dutyl')
	augroup DMaps
		au!
		au Filetype d nmap <silent> K :DUddoc<cr>
		au Filetype d nmap <silent> <c-k> :DUddoc<cr>
		au Filetype d nmap <silent> gd :DUjump<cr>
	augroup END
endif

if dein#tap('nvim-py-minimal')
	augroup pythonmapping
		autocmd!
		" -------------------------------------------------------
		" minimal-py
		" -------------------------------------------------------

		" au FileType python nmap  <buffer> ;p <Plug>(py-send-line-to-repl)<cr>
		" au FileType python vmap  <buffer> ;p <Plug>(py-send-selection-to-repl)<cr>
		" au FileType python map   <buffer> ;fp <Plug>(py-send-file-to-repl)<cr>

		au FileType python nmap  ;p :PySendLine<cr>
		au FileType python vmap  ;p :PySendSelection<cr>
		au FileType python nmap  ;fp :PySendFile<cr>

		au FileType python command! DbLine :call minpy#GoToDebugLine()<cr>
		au FileType python command! DbFile :call minpy#OpenDebugFile()<cr>

		" au FileType python nmap ;id :execute("Ipdb")<cr>
		au FileType python map <F9> :Ipdb<cr>
		" au FileType python map <F9> <Plug>Ipdb<cr>
		au FileType python nmap ;d :Ipdb<cr>

		au FileType python nmap ;bp Oimport ipdb; ipdb.set_trace()<esc>
		au FileType python nmap ;Bp oimport ipdb; ipdb.set_trace()<esc>
		au FileType python nmap ;db :minpy#DelBreakPoints()

		au FileType python nmap  <leader>bp <Plug>SetBreakPoint
		au FileType python nmap  <leader>Bp <Plug>SetBreakPointBelow
		nnoremap <leader>bd :call minpy#DelBreakPoints() " DelBreakPoints
		au TermOpen * nmap <buffer> gt <Plug>GoToDebugLine<cr>

		" autocmd Filetype python nmap <silent> ex "+yy :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
		" autocmd Filetype python vmap <silent> ex "+y :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
		" autocmd Filetype python nmap <silent> <c-e> "+yy :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
		" autocmd Filetype python vmap <silent> <c-e> "+y :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
		" autocmd Filetype python nnoremap <silent> ef :%y+<cr> :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
		"

		" nmap <c-e>: <Plug>PySendLine2Repl<cr>
		" xmap <c-e>: <Plug>PySendSelection2Repl<cr>
		" nmap eF : <Plug>PySendFile2Repl<cr>
	augroup END
endif


" if dein#tap('nvim-py-minimal')
"   au FileType python map  <leader>bp <Plug>SetBreakPoint
"   au FileType python map  <leader>Bp <Plug>SetBreakPointBelow
"   nnoremap <leader>bd :call minpy#DelBreakPoints() " DelBreakPoints
"   au TermOpen * nmap <buffer> gt <Plug>GoToDebugLine<cr>
"   au FileType python map <F5> <Plug>Ipdb<cr>

"   autocmd Filetype python nnoremap <silent> ef :%y+<cr> :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
"   autocmd Filetype python nmap <silent> ex "+yy :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
"   autocmd Filetype python vmap <silent> ex "+y :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
"   autocmd Filetype python nmap <silent> <c-e> "+yy :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>
"   autocmd Filetype python vmap <silent> <c-e> "+y :call minpy#send2repl(["\%paste"], g:last_ipy_terminal_job_id)<cr>

"   " nmap <c-e>: <Plug>PySendLine2Repl<cr>
"   " xmap <c-e>: <Plug>PySendSelection2Repl<cr>
"   " nmap eF : <Plug>PySendFile2Repl<cr>
" endif


" if dein#tap('iron.nvim')
" 	nmap <c-e> :call IronSend(getline('.'))<cr>
" 	xmap <c-e> :call IronSendMotion('visual')<cr>
" 	vmap <c-e> :call IronSendMotion('visual')<cr>

" 	nmap ex :call IronSend(getline('.'))<cr>
" 	xmap ex :call IronSendMotion('visual')<cr>
" 	vmap ex :call IronSendMotion('visual')<cr>

" xmap xe <Plug>(iron-send-motion)<cr>
" nmap <silent> <c-e> :call IronSend(getline('.'))<cr>

" endif

if dein#tap('LanguageClient-neovim')
	noremap <c-m> :call LanguageClient_contextMenu()<CR>
	" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
	" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
	" nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<cr>
	nnoremap <silent> <leader>lr :call LanguageClient_textDocument_rename()<cr>
	nnoremap <leader>ld :call LanguageClient_textDocument_definition()<cr>
	nnoremap  <leader>lh :call LanguageClient_textDocument_hover()<cr>

	nnoremap gb <c-o>
endif

if dein#tap('ale')
	nmap <F8> <Plug>(ale_fix)
	nmap <silent> <C-p> <Plug>(ale_previous_wrap)
	nmap <silent> <C-n> <Plug>(ale_next_wrap)
endif

if dein#tap('calendar.vim')
	nmap <leader>c :Calendar<cr>
endif

if dein#tap('nim.vim')
	fun! JumpToDef()
		if exists("*GotoDefinition_" . &filetype)
			call GotoDefinition_{&filetype}()
		else
			exe "norm! \<C-]>"
		endif
	endfunction

	" Jump to tag
	nn <M-g> :call JumpToDef()<cr>
	ino <M-g> <esc>:call JumpToDef()<cr>i
endif

if dein#tap('ropevim')
	nmap Q :call RopeShowDoc()
	nmap Rd :call RopeGotoDefinition()
	map <c-c>rd :call RopeGotoDefinition()
endif

if dein#tap('ncm2')
	autocmd! BufEnter,BufRead,BufNewFile *.* call ncm2#enable_for_buffer()
	set completeopt=noinsert,menuone,noselect
	set shortmess+=c
	inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
	inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
	inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	inoremap <expr> <c-j> pumvisible() ? "\<C-n>" : "\<c-j>"
	inoremap <expr> <c-k> pumvisible() ? "\<C-p>" : "\<c-k>"
	inoremap <expr> <down> pumvisible() ? "\<C-n>" : "\<down>"
	inoremap <expr> <up> pumvisible() ? "\<C-p>" : "\<up>"
	inoremap <expr><c-space> pumvisible() ? "\<c-x><c-o>" : "\<c-x><c-o>"

	au User Ncm2Plugin call ncm2#register_source({
		\ 'name' : 'css',
		\ 'priority': 9,
		\ 'subscope_enable': 1,
		\ 'scope': ['css','scss'],
		\ 'mark': 'css',
		\ 'word_pattern': '[\w\-]+',
		\ 'complete_pattern': ':\s*',
		\ 'on_complete': ['ncm2#on_complete#omni', 'csscomplete#CompleteCSS'],
		\ })
endif

if dein#tap('ncm2-ultisnips')
	" needs to come after other pumvisible for ncm2!!
	inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')
endif

if dein#tap('kronos')
	nmap <cr>   <plug>(kronos-toggle)
	nmap K      <plug>(kronos-info)
	nmap gc     <plug>(kronos-context)
	nmap gh     <plug>(kronos-hide-done)
	nmap gw     <plug>(kronos-worktime)
	nmap <c-n>  <plug>(kronos-next-cell)
	nmap <c-p>  <plug>(kronos-prev-cell)
	nmap dic    <plug>(kronos-delete-in-cell)
	nmap cic    <plug>(kronos-change-in-cell)
	nmap vic    <plug>(kronos-visual-in-cell)
endif


" vim: set ts=2 sw=2 tw=80 noet :
