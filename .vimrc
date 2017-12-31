set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on

" plugins
source $HOME/.vim/plugins.vim

" basic
source $HOME/.vim/basic.vim

" appearance
source $HOME/.vim/appearance.vim

" indent
source $HOME/.vim/indent.vim

" mappings
source $HOME/.vim/mappings.vim

" color
source $HOME/.vim/color.vim

" search
source $HOME/.vim/search.vim

" plugin's setting
source $HOME/.vim/setting_plugins.vim

" golang
source $HOME/.vim/go.vim

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
