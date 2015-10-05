"----------------------------------------------------
"" neobundle.vim
"----------------------------------------------------

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taglist.vim'

" tree
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'

" vimからGit操作する
NeoBundle 'tpope/vim-fugitive'

" ステータスラインをカッコよくする
NeoBundle 'alpaca-tc/alpaca_powertabline'
NeoBundle 'Lokaltog/powerline', { 'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Lokaltog/powerline-fontpatcher'

" インデントに色付け
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'tomtom/tcomment_vim'

" vimdoc 日本語
NeoBundle 'yuroyoro/vimdoc_ja'

" vim上のtwitter client
NeoBundle 'TwitVim'

"Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'djjcast/mirodark'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/phd'

"HTML, CSS, JavaScript
NeoBundle 'mattn/emmet-vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'AtsushiM/sass-compile.vim'
NeoBundle 'tpope/vim-haml'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'jelera/vim-javascript-syntax'

"Ruby, Ruby on Rails
NeoBundle 'rails.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise' " Ruby向けにendを挿入する

"DB
NeoBundle 'dbext.vim'
" Haskell
"NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'dag/vim2hs'

" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

" Swift
NeoBundle 'toyamarinyon/vim-swift'

" Golang
NeoBundle 'vim-jp/vim-go-extra'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

call neobundle#end()

"Required
filetype plugin indent on

NeoBundleCheck

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
" 挿入モードでCtrl-kを押すとクリップボードの内容をはりつけられるようにする
imap <C-p> <ESC>"*pa


" ----------
" statusline
" ----------
set laststatus=2	" 常にステータスラインを表示
set ruler 				" カーソル位置を表示

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
set laststatus=2

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
  autocmd FileType go					setlocal noexpandtab list tabstop=4 shiftwidth=4
endif

" ----------
" color
" ----------
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

" カーソルが行末にあるときにインサートからノーマルに
" なってしまうので一旦コメントアウト
" カーソルから行頭まで削除(インサートモード)
"inoremap <silent> <C-d> <Esc>lc^
" カーソルから行末まで削除(インサートモード)
"inoremap <silent> <C-f> <Esc>lc$

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
" neocompalecache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
"inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
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
let g:previm_open_cmd = 'open -a Firefox'

"" ----------------------------------------
"" 挿入モード時、ステータスラインの色を変更
"""" ---------------------------------------- 
"let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'
"
"if has('syntax')
"  augroup InsertHook
"    autocmd!
"    autocmd InsertEnter * call s:StatusLine('Enter')
"    autocmd InsertLeave * call s:StatusLine('Leave')
"  augroup END
"endif
"
"let s:slhlcmd = ''
"function! s:StatusLine(mode)
"  if a:mode == 'Enter'
"    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
"    silent exec g:hi_insert
"  else
"    highlight clear StatusLine
"    silent exec s:slhlcmd
"    redraw
"  endif
"endfunction
"
"function! s:GetHighlight(hi)
"  redir => hl
"  exec 'highlight '.a:hi
"  redir END
"  let hl = substitute(hl, '[\r\n]', '', 'g')
"  let hl = substitute(hl, 'xxx', '', '')
"  return hl
"endfunction

