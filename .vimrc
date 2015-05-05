"----------------------------------------------------
"" neobundle.vim
"----------------------------------------------------

if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
"NeoBundle 'ujihisa/unite-locate'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taglist.vim'
"NeoBundle 'ZenCoding.vim'
NeoBundle 'ref.vim'
NeoBundle 'The-NERD-tree'
NeoBundle 'The-NERD-Commenter'
NeoBundle 'fugitive.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'Gist.vim'
NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/unite-advent_calendar'
NeoBundle 'ctrlp.vim'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'nathanaelkane/vim-indent-guides' " indent に色付け
NeoBundle 'tomtom/tcomment_vim'
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
"Ruby, Ruby on Rails
NeoBundle 'rails.vim'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise' " Ruby向けにendを挿入する
"PHP
NeoBundle 'violetyk/cake.vim'
"DB
NeoBundle 'dbext.vim'
" Haskell
"NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'dag/vim2hs'
" Markdown
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

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

" 挿入モードでCtrl-kを押すとクリップボードの内容をはりつけられるようにする
imap <C-p> <ESC>"*pa

" ESC割り当て
imap <C-j> <esc>

" TABキーを空白に
""set expandtab
" 保存時にtabをスペースに変換
" autocmdBufWritePre * :%s/\t/  /ge
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
	autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et	
	autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et	
	autocmd FileType c			    setlocal sw=4 sts=4 ts=4 et	
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
	autocmd FileType go					setlocal noexpandtab list tabstop=2 shiftwidth=2
endif

" ----------
" color
" ----------
colorscheme hybrid
syntax enable

" ----------
" editing
" ----------
" 括弧を自動補完
"inoremap { {}<LEFT>
"inoremap [ []<LEFT>
"inoremap ( ()<LEFT>
"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>
"vnoremap { "zdi^V{<C-R>z}<ESC>
"vnoremap [ "zdi^V[<C-R>z]<ESC>
"vnoremap ( "zdi^V(<C-R>z)<ESC>
"vnoremap " "zdi^V"<C-R>z^V"<ESC>
"vnoremap ' "zdi'<C-R>z'<ESC>

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
"" sass-compile.vim
"------------------------------------
" ファイル保存時に自動コンパイル
let g:sass_compile_auto = 0
" 自動コンパイルを実行する拡張子
let g:sass_compile_file = ['scss', 'sass']

"------------------------------------
"" markdown
"------------------------------------
au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Firefox'

""----------------------------------------
"" ユーザーランタイムパス設定
""----------------------------------------
""Windows, unixでのruntimepathの違いを吸収するためのもの。 
""$MY_VIMRUNTIMEはユーザーランタイムディレクトリを示す。 
"":echo $MY_VIMRUNTIMEで実際のパスを確認できます。 
"if isdirectory($HOME . '/.vim') 
"	let $MY_VIMRUNTIME = $HOME.'/.vim' 
"elseif isdirectory($HOME . '\vimfiles') 
"	let $MY_VIMRUNTIME = $HOME.'\vimfiles' 
"elseif isdirectory($VIM . '\vimfiles') 
"	let $MY_VIMRUNTIME = $VIM.'\vimfiles' 
"endif 
""ランタイムパスを通す必要のあるプラグインを使用する場合
""$MY_VIMRUNTIMEを使用すると Windows/Linuxで切り分ける必要が無くなります。 
""例) vimfiles/qfixapp (Linuxでは~/.vim/qfixapp)にランタイムパスを通す場合 
""set runtimepath+=$MY_VIMRUNTIME/qfixapp
"
""----------------------------------------
"" システム設定
""----------------------------------------
"
""バックアップは上書きに成功した後に削除される。
"set nowritebackup
""バックアップ/スワップファイルを作成する/しない
"set nobackup
"set noswapfile
""viminfoを作成しない
""set viminfo=
""クリップボードを共有
"set clipboard+=unnamed
""8進数を無効にする。<C-a>,<C-x>に影響する
"set nrformats-=octal
""キーコードやマッピングされたキー列が完了するのを待つ時間(ミリ秒)
"set timeoutlen=3500
""編集結果非保存のバッファから、新しいバッファを開くときに警告を出さない
"set hidden
""ヒストリの保存数
"set history=50
""日本語の行の連結時には空白を入力しない
"set formatoptions+=mM
""Visual blockモードでフリーカーソルを有効にする
"set virtualedit=block
""カーソルキーで行末／行頭の移動可能に設定
"set whichwrap=b,s,[,],<,>
""バックスペースでインデントや改行を削除できるようにする
"set backspace=indent,eol,start
""□や○の文字があってもカーソル位置がずれないようにする
"set ambiwidth=double
""コマンドライン補完するときに強化されたものを使う
"set wildmenu
""マウスを有効にする
"if has('mouse')
"	set mouse=a
"endif
""pluginを使用可能にする
"filetype plugin indent on
""ESC割り当て
"imap <C-j> <esc>
"
"
""----------------------------------------
"" 検索
""----------------------------------------
""検索の時に大文字小文字を区別しない
""ただし大文字小文字の両方が含まれている場合は大文字小文字を区別する
"set ignorecase
"set smartcase
""検索時にファイルの最後まで行ったら最初に戻る
"set wrapscan
""インクリメンタルサーチ
"set incsearch
""検索文字の強調表示
"set hlsearch
""w,bの移動で認識する文字
""set iskeyword=a-z,A-Z,48-57,_,.,-,>
""vimgrep をデフォルトのgrepとする場合internal
""set grepprg=internal
"
""----------------------------------------
"" 表示設定
""----------------------------------------
""スプラッシュ(起動時のメッセージ)を表示しない
""set shortmess+=I
""エラー時の音とビジュアルベルの抑制(gvimは.gvimrcで設定)
"set noerrorbells
"set novisualbell
"set visualbell t_vb=
""マクロ実行中などの画面再描画を行わない
""set lazyredraw
""Windowsでディレクトリパスの区切り文字表示に / を使えるようにする
"set shellslash
""行番号表示
"set number
""カーソル行の背景色を変える
"set cursorline
""括弧の対応表示時間
"set showmatch matchtime=1
""不可視文字を表示
""set list
""不可視文字の表示記号指定
""setlistchars=tab: ,eol: 
""set listchars=tab:>-,trail:-,nbsp:%,extends:>,precedes:<
""タブを設定
""set ts=4 sw=4 sts=4
"set tabstop=2
"set shiftwidth=2
""set expandtab
""自動的にインデントする
"set autoindent
""Cインデントの設定
"set cinoptions+=:0
""タイトルを表示
"set title
""コマンドラインの高さ (gvimはgvimrcで指定)
"set cmdheight=2
"set laststatus=2
""コマンドをステータス行に表示
"set showcmd
""画面最後の行をできる限り表示する
"set display=lastline
"
""色テーマ設定
""gvimの色テーマは.gvimrcで指定する
"syntax enable
"set background=dark
""colorscheme solarized
"colorscheme hybrid
"
""vim の立ち上げ時にindent-guidesをオン
""let g:indent_guides_enable_on_vim_starup = 1
"
"""""""""""""""""""""""""""""""
""ステータスラインに文字コードやBOM、16進表示等表示
""iconvが使用可能の場合、カーソル上の文字コードをエンコードに応じた表示にするFencB()を使用
"""""""""""""""""""""""""""""""
"if has('iconv')
"	set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=[0x%{FencB()}]\ (%v,%l)/%L%8P\ 
"else
"	set statusline=%<%f\ %m\ %r%h%w%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=\ (%v,%l)/%L%8P\ 
"endif
"
"function! FencB()
"	let c = matchstr(getline('.'), '.', col('.') - 1)
"	let c = iconv(c, &enc, &fenc)
"	return s:Byte2hex(s:Str2byte(c))
"endfunction
"
"function! s:Str2byte(str)
"	return map(range(len(a:str)), 'char2nr(a:str[v:val])')
"endfunction
"
"function! s:Byte2hex(bytes)
"	return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
"endfunction
"
""----------------------------------------
"" diff/patch
""----------------------------------------
"" diffの設定
"if has('win95') || has('win16') || has('win32') || has('win64')
"	set diffexpr=MyDiff()
"	function! MyDiff()
"		silent! let saved_sxq=&shellxquote
"		silent! set shellxquote=
"		let opt = '-a --binary '
"		if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"		if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"		let arg1 = v:fname_in
"		if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"		let arg2 = v:fname_new
"		if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"		let arg3 = v:fname_out
"		if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"		" let cmd = '!diff ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"		let cmd = '!""' . $VIM . '\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
"		silent exe cmd
"		silent! let &shellxquote = saved_sxq
"	endfunction
"endif
""現バッファの差分表示(変更箇所の表示)
"command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis | wincmd p | diffthis
""ファイルまたはバッファ番号を指定して差分表示。#なら裏バッファと比較
"command! -nargs=? -complete=file Diff if '<args>'=='' | browse vertical diffsplit|else| vertical diffsplit <args>|endif
""パッチコマンド
"set patchexpr=MyPatch()
"function! MyPatch()
"	:call system($VIM."\\'.'patch -o " . v:fname_out . " " . v:fname_in . " < " . v:fname_diff)
"endfunction
"
""----------------------------------------
"" ノーマルモード
""----------------------------------------
""ヘルプ検索
"nnoremap <F1> K
""現在開いているvimスクリプトファイルを実行
"nnoremap <F8> :source %<CR>
""強制全保存終了を無効化
"nnoremap ZZ <Nop>
""カーソルをj k では表示行で移動する。物理行移動は<C-n>,<C-p>
""キーボードマクロには物理行移動を推奨
""h l はノーマルモードのみ行末、行頭を超えることが可能に設定(whichwrap) 
"" zvはカーソル位置の折り畳みを開くコマンド
"nnoremap <Down> gj
"nnoremap <Up>   gk
"nnoremap h <Left>zv
"nnoremap j gj
"nnoremap k gk
"nnoremap l <Right>zv
"
""taglist.vim
"set tags=tags
"let Tlist_Ctags_Cmd = "/usr/local/bin/ctags"  " ctagsのコマンド
"let Tlist_Show_One_File = 1							" 現在表示中のファイルのみのタグしか表示しない
"let Tlist_Use_Right_Window = 1          " 右側にtag listのウインドうを表示する
"let Tlist_Exit_OnlyWindow = 1           " taglistのウインドウだけならVimを閉じる
"map <silent> <leader>l :TlistToggle<CR> 
""\lでtaglistウインドウを開いたり閉じたり出来るショートカット
""----------------------------------------
"" 挿入モード
""----------------------------------------
"
"
"
""----------------------------------------
"" ビジュアルモード
""----------------------------------------
"
""----------------------------------------
"" コマンドモード
""----------------------------------------
"
"----------------------------------------
" Vimスクリプト
"----------------------------------------
""""""""""""""""""""""""""""""
"ファイルを開いたら前回のカーソル位置へ移動
""""""""""""""""""""""""""""""
augroup vimrcEx
	autocmd!
	autocmd BufReadPost *
				\ if line("'\"") > 1 && line("'\"") <= line('$') |
				\   exe "normal! g`\"" |
				\ endif
augroup END

""""""""""""""""""""""""""""""
"挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
	augroup InsertHook
		autocmd!
		autocmd InsertEnter * call s:StatusLine('Enter')
		autocmd InsertLeave * call s:StatusLine('Leave')
	augroup END
endif
" if has('unix') && !has('gui_running')
"   " ESCでキー入力待ちになる対策
"   inoremap <silent> <ESC> <ESC>
" endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
	if a:mode == 'Enter'
		silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
		silent exec g:hi_insert
	else
		highlight clear StatusLine
		silent exec s:slhlcmd
		redraw
	endif
endfunction

function! s:GetHighlight(hi)
	redir => hl
	exec 'highlight '.a:hi
	redir END
	let hl = substitute(hl, '[\r\n]', '', 'g')
	let hl = substitute(hl, 'xxx', '', '')
	return hl
endfunction

""""""""""""""""""""""""""""""
"全角スペースを表示
""""""""""""""""""""""""""""""
"コメント以外で全角スペースを指定しているので、scriptencodingと、
"このファイルのエンコードが一致するよう注意！
"強調表示されない場合、ここでscriptencodingを指定するとうまくいく事があります。
"scriptencoding cp932

"デフォルトのZenkakuSpaceを定義
function! ZenkakuSpace()
	highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
	augroup ZenkakuSpace
		autocmd!
		" ZenkakuSpaceをカラーファイルで設定するなら次の行は削除
		autocmd ColorScheme       * call ZenkakuSpace()
		" 全角スペースのハイライト指定
		autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
	augroup END
	call ZenkakuSpace()
endif
