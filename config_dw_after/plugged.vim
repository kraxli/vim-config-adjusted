
call plug#begin('~/.config/nvim/plugged')
if !exists('g:gui_oni')
   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

   " Plug 'landaire/deoplete-d', {'for': 'd'}
   " let g:deoplete#sources#d#dcd_server_autostart = 1

   " Plug 'autozimu/LanguageClient-neovim', {
   " \ 'branch': 'next',
   " \ 'do': 'bash install.sh',
   "       \ }
   " " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

   " (Optional) Multi-entry selection UI.

   " Plug 'prabirshrestha/async.vim'
   " Plug 'prabirshrestha/vim-lsp'
   " Plug 'prabirshrestha/asyncomplete.vim'
   " Plug 'prabirshrestha/asyncomplete-lsp.vim'

   " Plug 'natebosch/vim-lsc'
endif

" imap <c-space> <Plug>(asyncomplete_force_refresh)
" let g:asyncomplete_remove_duplicates = 1
" let g:asyncomplete_smart_completion = 1
" let g:asyncomplete_auto_popup = 1
" set completeopt+=preview
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif




" Make sure you use single quotes

" " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" " Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" " Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" " On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" " Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" " Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook

" let dir_dutils = '~/.dutils'
" let do_dlang_install = 'git submodule update --init --recursive \| make ldc'
" Plug 'dlang-community/DCD', {'dir': dir_dutils, 'do': do_dlang_install}
" Plug 'dlang-community/D-Scanner', {'dir': dir_dutils, 'do': do_dlang_install}
" Plug 'dlang-community/dfmt', {'dir': dir_dutils, 'do': do_dlang_install}

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


" " gabrielelana/vim-markdown
" https://github.com/jszakmeister/markdown2ctags
" Plug 'kraxli/tagbar-markdown.vim', {'for': ['markdown', 'vimwiki']}
" Plug 'msprev/unite-bibtex', {'for': ['tex', 'latex', 'pdc', 'pandoc', 'markdown']}
" Plug 'kraxli/vimwiki-task', {'for': ['vimwiki'], 'do': 'source $VIMPATH/config_dw_after/plugins/vimwiki.vim'}
" let g:vimwiki_folding = 'custom'

" hook_add: let g:vimwiki_folding = 'custom'
" hook_source: |
"   setlocal spell spelllang=en,de
" hook_post_source: source $VIMPATH/config_dw_after/plugins/vimwiki.vim

" "  TODO load on commands and maybe add mappings
" Plug 'dbmrq/vim-ditto', {'for': ['tex', 'latex', 'txt', 'text', 'pdc', 'pandoc', 'md', 'markdown', 'wiki', 'vimwiki']}
" Plug 'godlygeek/tabular', {'for': ['tex', 'latex', 'txt', 'text', 'pdc', 'pandoc', 'md', 'markdown', 'wiki', 'vimwiki']}
"
" =======
" LSP
" =======
" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ })
"  endif

" if executable('serve-d')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'serve-d',
"         \ 'cmd': {server_info->['serve-d']},
"         \ 'whitelist': ['d'],
"         \ })
"    " \ 'cmd': {server_info->['/home/dave/.dub/packages/serve-d-0.1.3/serve-d/serve-d']},
"  endif

" " =====================
" " LanguageClient-neovim
" " =====================

" set runtimepath+=~/.config/plugged/LanguageClient-neovim


