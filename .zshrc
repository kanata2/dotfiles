
#----------------------
#general setting
#----------------------
bindkey -e
export EDITOR=vim				#エディタをvimに設定
export LANG=ja_JP.UTF-8	#文字コードをUTF-8に設定

### Complement ###
autoload -U compinit; compinit #補完機能を有効にする
setopt auto_list #補完候補を一覧表示
setopt auto_menu #補完キー連打で補完候補を純に表示する
setopt list_packed #補完候補をできるだけ詰めて表示する
setopt list_types #補完候補にファイルの種類も表示する
bindkey "^[[Z" reverse-menu-complete #Shift-Tabで補完候補を逆順する

### History ###
HISTFILE=~/.zsh_history #ヒストリを保存するファイル
HISTSIZE=10000 #メモリに保存される件数
SAVEHIST=10000 #保存される件数
setopt hist_ignore_dups #直前と同じコマンドはヒストリに追加しない
setopt hist_reduce_blanks #余分なスペースを削除してヒストリに保存する

#---------------------
#Look and Feel Setting
#---------------------
#色の設定
export LSCOLORS=Exfxcxdxbxegedabagacad
#補完時の色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30tw=42;30:ow=43;30'
#ZLS_COLORSとは
export ZLS_COLORS=$LS_COLORS
#lsコマンド時、自動で色がつく
export CLICOLOR=true
#補完候補に色をつける
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#プロンプトに色を付ける
autoload -U colors; colors

#一般ユーザ時
#tmp_prompt="%{${fg[cyan]}%}%n%# %{${reset_color}%}"
tmp_prompt="%{${fg[cyan]}%}%(?!(╹◡╹) <!_(:3」∠ %)_ <) %{${reset_color}%}"
tmp_prompt2="%{${fg[cyan]}%}%_< %{${reset_color}%}"
tmp_rprompt="%{${fg[green]}%}[%~]%{${reset_color}%}"
tmp_sprompt="%{${fg[yellow]}%}%r is correct? [Yes, No, Abort, Edit]:%{${reset_color}%}"

# rootユーザ時(太字にし、アンダーバーをつける)
if [ ${UID} -eq 0 ]; then
  tmp_prompt="%B%U${tmp_prompt}%u%b"
  tmp_prompt2="%B%U${tmp_prompt2}%u%b"
  tmp_rprompt="%B%U${tmp_rprompt}%u%b"
  tmp_sprompt="%B%U${tmp_sprompt}%u%b"
fi

PROMPT=$tmp_prompt    # 通常のプロンプト
PROMPT2=$tmp_prompt2  # セカンダリのプロンプト(コマンドが2行以上の時に表示される)
RPROMPT=$tmp_rprompt  # 右側のプロンプト
SPROMPT=$tmp_sprompt  # スペル訂正用プロンプト

source ~/.zsh/titech.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`
