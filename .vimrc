syntax on
autocmd FileType ruby         set et sw=2 ts=2 sts=2
autocmd FileType eruby        set et sw=2 ts=2 sts=2
autocmd FileType yaml         set et sw=2 ts=2 sts=2
autocmd Filetype Gemfile      set ft=ruby
autocmd FileType javascript   set et sw=2 ts=2 sts=2
autocmd FileType css          set et sw=2 ts=2 sts=2
autocmd FileType yaml         set et sw=2 ts=2 sts=2
autocmd FileType python       set et sw=4 ts=4 sts=4
autocmd Filetype gitcommit    setlocal spell textwidth=72

set is
set hls
set ic
set scs
set incsearch

set ai
set cursorline
set copyindent
set smartindent
set encoding=utf-8
set expandtab
set laststatus=1
set nu
set wildmenu
set wildmode=list:longest
set nowrap
set novisualbell
set noerrorbells
set showmatch
set ch=1
set clipboard=unnamed

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
