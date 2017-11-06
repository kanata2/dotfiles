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

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src

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

function ped() {
    ack "$@" . | peco --exec 'awk -F : '"'"'{print "+" $2 " " $1}'"'"' | xargs -o vim'
}
zle -N ped

# local settings
if [[ -z $TMUX ]]; then
    [ -f ~/.zshrc.local ] && source ~/.zshrc.local
    [ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
fi

# source $HOME/.zsh/zplug.zsh
source $HOME/.zsh/basic.zsh
source $HOME/.zsh/completion.zsh
source $HOME/.zsh/history.zsh
source $HOME/.zsh/color.zsh

bindkey '^R' peco-history-selection
bindkey '^]' peco-src
bindkey '^\' ped
bindkey '^q' peco-find-file

# profile
# if (which zprof > /dev/null) ;then
#   zprof | less
# fi
