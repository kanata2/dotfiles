set ffs=unix,dos,mac
set encoding=utf-8

" keymap leader
let mapleader = ","

set textwidth=0
set nobackup
set autoread
set noswapfile
set hidden
set vb t_vb=
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set showcmd
set showmode
set viminfo=

" clipboard
set clipboard+=unnamed

" paste the content of clipboard by Ctrl-v (insert mode)
imap <C-v> <ESC>"*pa

" mouse
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" complete
set wildmenu
set wildchar=<tab>
set wildmode=list:full
set history=1000
set complete+=k
