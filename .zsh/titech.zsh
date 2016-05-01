# proxy auto change
switch_trigger=titech-pubnet # アクセスポイント名

function usage() {
cat <<_EOF_
Usage:
  ./swich_trigger
Description:
  titech-pubnetのときにプロキシ設定を有効にする.

Options:

_EOF_
exit 1
}

function set_proxy() {
  git config --global include.path .gitconfig.local
}

function unset_proxy() {
  git config --global --unset include.path
}

if [ "`networksetup -getairportnetwork en0 | awk '{print $4}'`" = "$switch_trigger" ]; then
  echo "Switch to proxy for titech-pubnet"
  sed -i '' '/\[include\]/d' $HOME/.gitconfig
  set_proxy
else
  unset_proxy
fi
