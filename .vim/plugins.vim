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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'tpope/vim-fugitive'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'

" Testing
Plug 'janko-m/vim-test'
Plug 'tpope/vim-dispatch'

" Moving
Plug 'cocopon/vaffle.vim'

" Syntax
" JSON
Plug 'elzr/vim-json'

" JavaScript
Plug 'leafgarland/typescript-vim'

" Markdown
Plug 'plasticboy/vim-markdown'

" Nginx
Plug 'chr4/nginx.vim'

" Ruby
Plug 'vim-ruby/vim-ruby'

" Rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" Terraform
Plug 'hashivim/vim-terraform'

" tmux
Plug 'keith/tmux.vim'

" TOML
Plug 'cespare/vim-toml'

" Others
Plug 'thinca/vim-quickrun'
Plug 'kien/ctrlp.vim'
Plug 'jjo/vim-cue'

call plug#end()

