source ~/.vim/plugins.vim

" ---------
" Basic
" ---------
let mapleader = ","		" キーマップリーダー
set textwidth=0				" 自動折り返しをしない
set nobackup					" バックアップを取らない
set autoread					" 他で書き換えられたら自動で読み直す
set noswapfile				" スワップファイルを作らない
set hidden						" 編集中でも他のファイルを開けるようにする
set vb t_vb=					" ビーブ音を鳴らさない
" バックスペースキーで何でも消せるようにする
set backspace=indent,eol,start
" カーソルを行頭・行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
set showcmd						" コマンドをステータス行に表示
set showmode					" 現在のモードを表示
set viminfo=					" viminfoファイルを作らない
" OSのクリップボードを使用する
set clipboard+=unnamed
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a
set ttymouse=xterm2

" ヤンクした文字をシステムのクリップボードへ
set clipboard=unnamed
" 挿入モードでCtrl-vを押すとクリップボードの内容をはりつけられるようにする
imap <C-v> <ESC>"*pa


" ----------
" statusline
" ----------
set ruler 				" カーソル位置を表示
set laststatus=2

" ----------
" Appearance
" ----------
set showmatch			" 括弧の対応をハイライト	
set number				" 行番号表示
set list					" 不可視文字表示
" 不可視文字の表示形式
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set display=uhex	" 印字不可能文字を16進数で表示
set ttyfast				" 高速ターミナル接続
set cursorline		" カーソル行ハイライト
" コマンドラインの高さ
set cmdheight=2

" ----------
" indent
" ----------
set autoindent		" 自動でインデント
set smartindent		" 新しい行を開始した時、現在行とインデントを揃える
set cindent				" Cプログラムファイルの自動インデント
"
set tabstop=2 shiftwidth=2 softtabstop=0
if has("autocmd")
  filetype plugin on
  filetype indent on
  autocmd BufRead,BufNewFile *.erb set filetype=eruby.html
  autocmd BufRead,BufNewFile *.vue set filetype=html
  autocmd BufRead,BufNewFile *.coffee set filetype=coffee
  autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType c			    setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType cpp				setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType cs			    setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType css		    setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType diff     	setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType eruby     	setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType html     	setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType java    		setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType javascript	setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType perl  	  	setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType php    	 	setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType python     setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType ruby	     	setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType haml				setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType scheme 		setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType sh					setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType sql				setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType vb					setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType vim				setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType wsh				setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType xhtml			setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType xml				setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType yaml				setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType zsh				setlocal sw=4 sts=4 ts=4 et	
  autocmd FileType scala			setlocal sw=2 sts=2 ts=2 et	
  autocmd FileType go					setlocal sw=4 sts=4 ts=4 et noexpandtab
endif

" ----------
" color
" ----------
set background=dark
colorscheme hybrid
"colorscheme solarized

" ターミナルのタイプによるカラー設定
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

" ハイライト on
syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
" golang の err を色付け
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

" ----------
" editing
" ----------
" 括弧を自動補完
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

" ----------
"  move
" ----------
" insert mode での移動
inoremap  <C-e> <END>
inoremap  <C-a> <HOME>
" インサートモードでもhjklで移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" カーソル位置の単語を yank
nnoremap vy vawy

" ESC割り当て
inoremap jj <ESC>

" 前回終了したカーソル行に移動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" -----------
" complete
" -----------
set wildmenu						" コマンド補完を強化
set wildchar=<tab>			" コマンド補完を開始するキー
set wildmode=list:full	" リスト表示、最長マッチ
set history=1000							" コマンド・検索パターンの履歴数
set complete+=k					" 補完に辞書ファイル追加

" -----------
" encoding
" -----------
set ffs=unix,dos,mac		" 改行文字
set encoding=utf-8

"-----------
" search
"-----------
"検索の時に大文字小文字を区別しない
"ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
set ignorecase
set smartcase
"検索時にファイルの最後まで行ったら最初に戻る
set wrapscan
"インクリメンタルサーチ
set incsearch
"検索文字の強調表示
set hlsearch
"w,bの移動で認識する文字
"set iskeyword=a-z,A-Z,48-57,_,.,-,>
"vimgrep をデフォルトのgrepとする場合internal
"set grepprg=internal


" ----------------
" plugin's setting
" ----------------
let g:go_fmt_command = "goimpoorts"
" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-o>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-p>, <BS>: close popup and delete backword char.
"inoremap <expr><C-p> neocomplete#smart_close_popup()."\<C-p>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neosnippet.vim
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

"------------------------------------
"" Emmet.vim
"------------------------------------
" en -> ja
let g:user_emmet_settings = {
      \  'lang' : 'ja'
      \ }

"------------------------------------
"" vim-indent-guides
"------------------------------------
nnoremap <silent> <Space>id :<C-u>IndentGuidesToggle<Enter>
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 4
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
if 'dark' == &background
  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
else
  hi IndentGuidesOdd  ctermbg=white
  hi IndentGuidesEven ctermbg=lightgrey
endif

"------------------------------------
"" markdown
"------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Google\ Chrome'
let g:vim_markdown_folding_disabled=1


" jsx, js highlight
let g:jsx_ext_required = 0
