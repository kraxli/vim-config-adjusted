
if has('nvim')
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

   augroup Terminal
      au!
      au TermOpen * let g:last_terminal_job_id = b:terminal_job_id
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


   " Which will save the the job id of the last created terminal into the g:last_terminal_job_id variable. Then you can create some functions/commands/mappings that will send the data using the jobsend function, here's an example:

function! REPLSend(lines)
   " type(a:lines) == 3	  => list
   call jobsend(g:last_terminal_job_id, add(a:lines, ''))
endfunction

command! REPLSendLine call REPLSend([getline('.')])
command! -range=% REPLSendFile silent call REPLSend(getline(<line1>,<line2>))
command! -range REPLSendSelection silent call REPLSend(getline(<line1>,<line2>))
" send visual selection to ipython terminal:
command! -range REPLSendIPy silent call REPLSend(["\%paste"])


if g:dwc_terminal_keys
   nnoremap <silent> <f5> :REPLSendLine<cr>
   vnoremap <silent> <f5>  :REPLSendSelection<cr>
   nnoremap <silent> f<f5> :REPLSendFile<cr>
endif


if g:dwc_ipython_terminal
   augroup terminalPython
      au!
      autocmd Filetype python nnoremap <silent> <f5> "+yy :call REPLSend(["\%paste"])<cr>
      autocmd Filetype python vnoremap <silent> <f5> "+y :call REPLSend(["\%paste"])<cr>
      autocmd Filetype python nnoremap <silent> f<f5> :%y+<cr> :call REPLSend(["\%paste"])<cr>
      autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython2 :vsp term://ipython
      autocmd BufRead,BufEnter,BufNewFile *.py,*.python :command! IPython3 :vsp term://ipython3
   augroup END
endif


endif " end has('nvim')
