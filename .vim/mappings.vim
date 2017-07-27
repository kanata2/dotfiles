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
