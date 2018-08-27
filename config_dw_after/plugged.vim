
call plug#begin('~/.config/nvim/plugged')
   if !exists('g:gui_oni')
      Plug 'landaire/deoplete-d', {'for': 'd'}
      let g:deoplete#sources#d#dcd_server_autostart = 1
   endif

   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


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


