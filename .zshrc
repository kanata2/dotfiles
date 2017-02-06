function peco-history-selection() {
    typeset tac
    if which tac > /dev/null; then
        tac=tac
    else
        tac='tail -r'
    fi
    BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle redisplay
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

function peco-find-file() {
	if git rev-parse 2> /dev/null; then
		source_files=$(git ls-files)
	else
		source_files=$(find . -maxdepth 3 -type f)
	fi
	selected_files=$(echo $source_files | peco --prompt "[find file]")

	BUFFER="${BUFFER}$(echo $selected_files | tr '\n' ' ')"
	CURSOR=$#BUFFER
	zle redisplay
}
zle -N peco-find-file
stty -ixon
bindkey '^q' peco-find-file

# zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# general
source $HOME/.zsh/basic.zsh

# complement
source $HOME/.zsh/completion.zsh

# history
source $HOME/.zsh/history.zsh

# color
source $HOME/.zsh/color.zsh

# local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# profile
if (which zprof > /dev/null) ;then
  zprof | less
fi
