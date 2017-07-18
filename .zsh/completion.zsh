fpath+=$HOME/.zfunc
autoload -U compinit
compinit

# display of the completion
setopt auto_list
setopt auto_menu
setopt list_packed
setopt list_types

# Shift + Tab
bindkey "^[[Z" reverse-menu-complete
