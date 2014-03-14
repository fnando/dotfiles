" Maintained by: Nando Vieira
" http://nandovieira.com

set nocompatible

if filereadable(expand("~/.vundle.vim"))
  source ~/.vundle.vim
endif

syntax on

autocmd FileType vim          set et sw=2 ts=2 sts=2
autocmd FileType sh           set et sw=2 ts=2 sts=2
autocmd FileType css          set et sw=2 ts=2 sts=2
autocmd FileType scss         set et sw=2 ts=2 sts=2
autocmd FileType html         set et sw=2 ts=2 sts=2
autocmd FileType eruby        set et sw=2 ts=2 sts=2
autocmd FileType javascript   set et sw=2 ts=2 sts=2
autocmd FileType python       set et sw=4 ts=4 sts=4
autocmd FileType ruby         set et sw=2 ts=2 sts=2
autocmd FileType yaml         set et sw=2 ts=2 sts=2
autocmd FileType markdown     set et sw=2 ts=2 sts=2
autocmd Filetype Gemfile      set ft=ruby
autocmd Filetype Capfile      set ft=ruby
autocmd Filetype gitcommit    setlocal spell textwidth=72

map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ["node_modules", "tmp", "log/*", ".git"]
let NERDTreeShowHidden = 1

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

autocmd Filetype markdown setlocal wrap
autocmd Filetype markdown setlocal linebreak
autocmd Filetype markdown setlocal nolist

autocmd FileType vim,ruby,javascript,css,python,php autocmd BufWritePre <buffer> :%s/\s\+$//e

set t_Co=256

silent! colorscheme soda

let mapleader = ","

nnoremap / /\v
vnoremap / /\v

nnoremap <tab> %
vnoremap <tab> %

nnoremap j gj
nnoremap k gk

let g:AutoPairs = { '(': ')', '[': ']', '{': '}', "'": "'", '"': '"', '`': '`', '<': '>', '%': '%' }
let g:bufferline_echo = 0

" Save with ctrl+s
noremap <silent> <C-S>  :update<CR>
vnoremap <silent> <C-S> <C-C>:update<CR>
inoremap <silent> <C-S> <C-O>:update<CR>

" Indent guides.
highlight IndentGuidesOdd  ctermbg=white
highlight IndentGuidesEven ctermbg=lightgrey

" Disable F1 for help.
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Visual shift.
vnoremap < <gv
vnoremap > >gv

" Forgot sudo?
cmap w!! w !sudo tee % >/dev/null

set autoindent
set autoread
set background=light
set clipboard=unnamed
set cmdheight=1
"set colorcolumn=80
set copyindent
set cursorline
set encoding=utf-8
set eol
set expandtab
set gdefault
set hidden
set history=1000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set linespace=5
set list
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·
set nobackup
set noerrorbells
set noswapfile
set novisualbell
set nowrap
set nowritebackup
set number
set scrolloff=8
set showmatch
set noshowmode
set sidescroll=1
set sidescrolloff=15
set smartcase
set smartindent
set wildmenu
set wildmode=list:longest
set wildignore+=*.png,*.jpg,*.gif,*.o,.git,tmp/**,coverage/**,node_modules/**,.DS_Store

nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
