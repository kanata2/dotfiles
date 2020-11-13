" Install vim-plug if we don't already have it
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" LSP
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" Go
Plug 'mattn/vim-goimports'

" Appearance
Plug 'itchyny/lightline.vim'

" Colorscheme
Plug 'w0ng/vim-hybrid'

Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'mattn/emmet-vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue'] }

" Testing
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Moving
Plug 'cocopon/vaffle.vim'

" Syntax
" CSS
Plug 'hail2u/vim-css3-syntax'

" JSON
Plug 'elzr/vim-json'

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
