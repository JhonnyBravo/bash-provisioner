#!/bin/bash

script_name=$(basename "$0")

package="nodebrew"
i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-i] [-u] [-h]


DESCRIPTION:
       ${package} をインストール / アンインストールします。

OPTIONS:
       -i     ${package} をインストールします。

       -u     ${package} をアンインストールします。

       -h     ヘルプを表示します。
_EOT_
exit 1
}

while getopts "iuh" option
do
  case $option in
    i)
      i_flag=1
      ;;
    u)
      u_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

curl -h

if [ $? -ne 0 ]; then
  echo 'curl をインストールしてください。'
  exit 2
fi

if [ $i_flag -eq 1 ]; then
  if [ ! -d ~/.nodebrew ]; then
    curl -L git.io/nodebrew | perl - setup
    # shellcheck disable=SC2016
    echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >>~/.bashrc
  fi
elif [ $u_flag -eq 1 ]; then
  rm -R ~/.nodebrew
  (sed -e "/nodebrew/d" <~/.bashrc) >.bashrc
  install -m=644 .bashrc ~/
  rm .bashrc
fi
