call plug#begin('~/.vim/plugged')
" Appearance
Plug 'itchyny/lightline.vim'

" Colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'

" Completion
Plug 'Shougo/neocomplete'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
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
Plug 'unite.vim'
Plug 'basyura/unite-rails'

" Syntax
" CSS
Plug 'hail2u/vim-css3-syntax'

" Golang
Plug 'fatih/vim-go'
Plug 'vim-jp/vim-go-extra'

" Julia
Plug 'JuliaLang/julia-vim'

" JSON
Plug 'elzr/vim-json'

" HTML
Plug 'tpope/vim-haml'
Plug 'slim-template/vim-slim'

" JavaScript
Plug 'pangloss/vim-javascript'

" Markdown
Plug 'plasticboy/vim-markdown'

" Nginx
Plug 'nginx.vim'

" Ruby, Ruby on Rails
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Rust
Plug 'rust-lang/rust.vim'

" TeX
Plug 'vim-latex/vim-latex'

" tmux
Plug 'keith/tmux.vim'

" TOML
Plug 'cespare/vim-toml'
call plug#end()
