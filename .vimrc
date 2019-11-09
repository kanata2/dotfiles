set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on

source $HOME/.vim/plugins.vim
source $HOME/.vim/basic.vim
source $HOME/.vim/appearance.vim
source $HOME/.vim/indent.vim
source $HOME/.vim/mappings.vim
source $HOME/.vim/color.vim
source $HOME/.vim/search.vim
source $HOME/.vim/setting_plugins.vim
source $HOME/.vim/go.vim

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
