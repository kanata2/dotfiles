source $ZPLUG_HOME/init.zsh

zplug "zplug/zplug"

if ! zplug check; then
    zplug install > /dev/null
fi

zplug load --verbose > /dev/null
