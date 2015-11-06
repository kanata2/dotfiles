
DOTPATH=~/dotfiles
GITHUB_URL="https://github.com/naoki-k/dotfiles"

if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

elif has "curl" || has "wget"; then
    compressed = "https://github.com/naoki-k/dotfiles.tar.gz"

    if has "curl"; then
        curl -L "$compressed"

    elif
        wget -O - "$compressed"
    fi | tar xv -

    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required!"
fi

cd ~/dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done
