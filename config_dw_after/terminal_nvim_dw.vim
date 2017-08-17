
" To map <Esc> to exit terminal-mode: >
tnoremap <Esc> <C-\><C-n>

" To simulate |i_CTRL-R| in terminal-mode: >
tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'

" To use `ALT+{h,j,k,l}` to navigate windows from any mode: >
tnoremap <c-left> <C-\><C-N><C-w>h
tnoremap <c-down> <C-\><C-N><C-w>j
tnoremap <c-up> <C-\><C-N><C-w>k
tnoremap <c-right> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

augroup TerminalGroup
   au TermOpen * nmap <buffer> gf :call dway#term#term_gf()<cr>
   au TermOpen * nmap <buffer> <cr> :call dway#term#term_gf()<cr>

   au TermOpen * nmap <buffer> gF :call dway#term#term_gf_tabnew()<cr>
   au TermOpen * nmap <buffer> <s-cr> :call dway#term#term_gf_tabnew()<cr>
augroup END

" Window split settings
" set splitbelow
" set splitright

" source: https://medium.com/@garoth/neovim-terminal-usecases-tricks-8961e5ac19b9

" source: https://vi.stackexchange.com/questions/2764/send-text-from-one-split-window-to-another
" or use Neoterm plugin

" Neovim terminal buffers always have an associated job id, so one way is to use the job control API to send the text. Add this to your vimrc:
"
" augroup Terminal
"   au!
"   au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
" augroup END
"
" Which will save the the job id of the last created terminal into the g:last_terminal_job_id variable. Then you can create some functions/commands/mappings that will send the data using the jobsend function, here's an example:
"
" function! REPLSend(lines)
"   call jobsend(g:last_terminal_job_id, add(a:lines, ''))
" endfunction
"
" command! REPLSendLine call REPLSend([getline('.')])
"
" nnoremap <silent> <f6> :REPLSendLine<cr>
"
" The above would send the current line, but you can extend it to send visual selection.
"
