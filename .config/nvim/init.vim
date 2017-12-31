" vim-plug {{{
call plug#begin('~/.vim/plugged')
Plug 'cocopon/vaffle.vim'
Plug 'itchyny/lightline.vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'mattn/gist-vim'
Plug 'mattn/webapi-vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'mhartington/nvim-typescript'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'Shougo/deoplete-rct'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'w0rp/ale'

" language
Plug 'cespare/vim-toml'
Plug 'derekwyatt/vim-scala'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'fatih/vim-go'
Plug 'hail2u/vim-css3-syntax'
Plug 'hashivim/vim-terraform'
Plug 'itchyny/vim-haskell-indent'
Plug 'keith/tmux.vim'
Plug 'leafgarland/typescript-vim'
Plug 'chr4/nginx.vim'
Plug 'pangloss/vim-javascript'
Plug 'plasticboy/vim-markdown'
Plug 'posva/vim-vue'
Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
call plug#end()
" }}}

" basic {{{
set encoding=utf-8
scriptencoding utf-8

set cmdheight=2
" display the unprintable characters in hex
set display=uhex
set laststatus=2
set list
" display format of invisible characters
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set number
set ruler
set scrolloff=10
set showmatch
set ttyfast
set autoread
set backspace=indent,eol,start

" clipboard
set clipboard+=unnamed

set ffs=unix,dos,mac
set hidden
set nobackup
set noerrorbells
set noswapfile
set showcmd
set showmode
set textwidth=0
set viminfo=
set visualbell t_vb=
set whichwrap=b,s,h,l,<,>,[,]

" mouse
set mouse=a
set guioptions+=a

" complete
set wildmenu
set wildchar=<tab>
set wildmode=list:full
set history=1000
set complete+=k

set autoindent
set smartindent
set cindent
set expandtab
set tabstop=4 shiftwidth=2 softtabstop=0

set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch
" }}}

" colors {{{
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

set background=dark
autocmd ColorScheme * highlight LineNr ctermfg=143
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
colorscheme hybrid
" }}}

" mappings {{{
" keymap leader
let g:mapleader = ","

" paste the content of clipboard by Ctrl-v (insert mode)
imap <C-v> <ESC>"*pa

" replacement ;, : (normal mode)
nnoremap ; :
nnoremap : ;

" brackets
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap " ""<LEFT>
inoremap ' ''<LEFT>
vnoremap { "zdi^V{<C-R>z}<ESC>
vnoremap [ "zdi^V[<C-R>z]<ESC>
vnoremap ( "zdi^V(<C-R>z)<ESC>
vnoremap " "zdi^V"<C-R>z^V"<ESC>
vnoremap ' "zdi'<C-R>z'<ESC>

" emacs like (insert mode)
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>

" hjkl (insert mode)
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" yank the word under the cursor
nnoremap vy vawy

" ESC
inoremap jj <ESC>

" cli history like
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" }}}
"" plugin's setting {{{1
"" lightline.vim {{{2
"let g:lightline = {
"      \ 'active': {
"      \   'left': [
"      \     ['mode', 'paste'],
"      \     ['readonly', 'fugitive', 'filename', 'ale', 'modified']
"      \   ],
"      \ },
"      \ 'component_function': {
"      \   'ale': 'LightlineALE',
"      \   'filename': 'LightlineFilename',
"      \   'fugitive': 'LightlineFugitive',
"      \   'modified': 'LightlineModified',
"      \   'readonly': 'LightlineReadonly'
"      \ }
"      \ }
"
"function! LightlineALE()
"  if exists('g:loaded_ale')
"    return ALEGetStatusLine()
"  else
"    return ''
"  endif
"endfunction
"
"function! LightlineFilename()
"  let filename = expand('%:t')
"  if strlen(filename) > 20
"    return filename[0:10].'...'.filename[-11:-1]
"  endif
"  return ('' != filename ? filename : '[No Name]')
"endfunction
"
"function! LightlineFugitive()
"  if exists('*fugitive#head')
"    let branch = fugitive#head()
"    return branch !=# '' ? '⭠ '.branch : ''
"  endif
"  return ''
"endfunction
"
"function! LightlineModified()
"  if &modified
"    return '+'
"  elseif &modifiable
"    return ''
"  else
"    return ''
"  endif
"endfunction
"
"function! LightlineReadonly()
"  if &readonly
"    return '⭤'
"  else
"    return ''
"  endif
"endfunction
"
"" }}}2
"
"" deoplete {{{2
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 100

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ neocomplete#start_manual_complete()
function! s:check_back_space() "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <expr><C-h>
      \ deoplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>
      \ deoplete#smart_close_popup()."\<C-h>"

" {{{ 3 go
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" }}} 3
" {{{ 3 rust
let g:deoplete#sources#rust#racer_binary = $HOME.'.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = $RUST_SRC_PATH
" }}} 3
" }}} 2

"
"
"" neosnippet.vim {{{2
"let g:neosnippet#enable_snipmate_compatibility = 1
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'
"" }}}
"
"" emmet.vim {{{2
"" en -> ja
"let g:user_emmet_settings = {
"      \  'lang' : 'ja'
"      \ }
"" }}}
"
"" ale {{{2
"let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
"let g:ale_sign_column_always = 1
"let g:ale_linters = {
"      \ 'go': ['gometalinter']
"      \ }
"let g:ale_go_gometalinter_options = '--disable-all --enable=vet --enable=golint -t'
"" }}}2
"
"" vim-go {{{2
"au FileType go nmap <leader>r <Plug>(go-run)
"au FileType go nmap <leader>b <Plug>(go-build)
"au FileType go nmap <leader>t <Plug>(go-test)
"au FileType go nmap <leader>c <Plug>(go-coverage)
"
"let g:go_gocode_unimported_packages = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_types = 1
"
"" Enable goimports to automatically insert import paths instead of gofmt
"let g:go_fmt_command = "goimports"
"" }}}2
"
"" vim-latex {{{2
"" FIXME: https://github.com/vim-latex/vim-latex/blob/master/plugin/imaps.vim#L540
"imap <C-g> <Plug>IMAP_JumpForward
"nmap <C-g> <Plug>IMAP_JumpForward
"" }}}2
"
"" vim-markdown
"let g:vim_markdown_math = 1
"
"" vim-quickrun {{{2
"let g:quickrun_config = {'*': {'hook/time/enable': '1'},}
"let g:quickrun_config.haskell = {
"      \ 'type': 'haskell/stack',
"      \ 'command': 'stack',
"      \ 'exec': '%c %o %s %a',
"      \ 'cmdopt': 'runghc',
"      \ }
"nnoremap <silent> <C-q> :QuickRun<CR>
"" }}}2
"
"" rust.vim
"let g:rustfmt_autosave = 1
"let g:rustfmt_command = '$HOME/.cargo/bin/rustfmt'
"
"" vim-racer {{{2
"au FileType rust nmap gd <Plug>(rust-def)
"au FileType rust nmap gs <Plug>(rust-def-split)
"au FileType rust nmap gx <Plug>(rust-def-vertical)
"au FileType rust nmap <leader>d <Plug>(rust-doc)
"
"let g:racer_cmd = "$HOME/.cargo/bin/racer"
"let g:racer_experimental_completer = 1
"" }}}2
"
"" ctrlp.vim
"let g:ctrlp_working_path_mode = 'ra'
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
"
"let g:ctrlp_custom_ignore = '\v[\/](node_modules|vendor|dist)|(\.(git|hg|svn))$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](node_modules|vendor|dist)|(\.(git|hg|svn))$',
"  \ 'file': '\v\.(exe|so|dll)$',
"  \ 'link': 'some_bad_symbolic_links',
"  \ }
"" vaffle.vim
"let g:vaffle_show_hidden_files = 1
"" }}}1

" indentation {{{
augroup vimrc
  filetype plugin indent on
  autocmd!
  autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scss       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
  autocmd FileType julia      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType markdown   setlocal sw=2 sts=2 ts=2 et
  autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType scheme     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sql        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
  autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
  autocmd FileType go         setlocal sw=4 sts=4 ts=4 et noexpandtab
augroup END
" }}}

" vim:set foldmethod=marker:
