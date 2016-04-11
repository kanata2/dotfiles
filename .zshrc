# general
source $HOME/.zsh/basic.zsh

# complement
source $HOME/.zsh/completion.zsh

# history
source $HOME/.zsh/history.zsh

# color
source $HOME/.zsh/color.zsh

# settings for titech network on Mac
if type networksetup >/dev/null 2>&1; then
    source ~/.zsh/titech.zsh
fi

# local settings
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
[ -f ~/.zshrc.`uname` ] && source ~/.zshrc.`uname`

# profile
if (which zprof > /dev/null) ;then
  zprof | less
fi
