source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"

if ! zplug check; then
    zplug install
fi

zplug load --verbose
