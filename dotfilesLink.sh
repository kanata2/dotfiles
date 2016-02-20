#! /bin/bash
for dotfiles in $(echo .*[^.] |
    tr ' ' '\n' |
    awk '!/DS_|git.?$/')
do
    ln -fnsv $PWD/$dotfiles $HOME/$dotfiles
done

