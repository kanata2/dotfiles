call plug#begin('~/.vim/plugged')
" Appearance
Plug 'itchyny/lightline.vim'

" Colorscheme
Plug 'w0ng/vim-hybrid'

" Completion
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'zchee/deoplete-clang'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mhartington/nvim-typescript'
Plug 'sebastianmarkow/deoplete-rust'

Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Lint
Plug 'w0rp/ale'

" Moving
Plug 'cocopon/vaffle.vim'

" Syntax
" CSS
Plug 'hail2u/vim-css3-syntax'

" Golang
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}

" JSON
Plug 'elzr/vim-json'

" Haskell
Plug 'itchyny/vim-haskell-indent'

" HTML
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'
Plug 'digitaltoad/vim-pug'

" JavaScript
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim'

" Markdown
Plug 'plasticboy/vim-markdown'

" Nginx
Plug 'chr4/nginx.vim'

" Ruby, Ruby on Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Scala
Plug 'derekwyatt/vim-scala'

" Terraform
Plug 'hashivim/vim-terraform'

" TeX
Plug 'vim-latex/vim-latex'

" tmux
Plug 'keith/tmux.vim'

" TOML
Plug 'cespare/vim-toml'

" Others
Plug 'thinca/vim-quickrun'
Plug 'kien/ctrlp.vim'
call plug#end()
