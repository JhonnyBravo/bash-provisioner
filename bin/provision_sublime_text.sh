#!/bin/bash

PACKAGE="ibus-mozc emacs-mozc"

i_flag=0
u_flag=0
p_flag=0

function usage(){
cat <<_EOT_
Usage:
  ${0} [-i] [-u] [-p] [-h]

Description:
  sublime-text ${1} をインストール / アンインストールします。

Options:
  -i sublime-text ${1} をインストールします。
  -u sublime-text ${1} をアンインストールします。
  -p Package Control.sublime-package をインストールします。
  -h ヘルプを表示します。
_EOT_
exit 1
}

while getopts "iuph" option
do
  case $option in
    i)
      i_flag=1
      ;;
    u)
      u_flag=1
      ;;
    p)
      p_flag=1
      ;;
    h)
      usage "$PACKAGE"
      ;;
    \?)
      usage "$PACKAGE"
      ;;
  esac
done

if [ $i_flag -eq 1 ]; then
  subl -h

  if [ $? -ne 0 ]; then
    wget -P ~/Downloads https://download.sublimetext.com/sublime-text_build-3103_i386.deb
    dpkg -i ~/Downloads/sublime-text*.deb
  fi

  # shellcheck disable=SC2086
  apt-get install $PACKAGE
elif [ $u_flag -eq 1 ]; then
  # shellcheck disable=SC2086
  dpkg -P sublime-text
  apt-get purge $PACKAGE
elif [ $p_flag -eq 1 ]; then
  subl -h

  if [ $? -eq 0 ]; then
    wget -P ~/.config/sublime-text-3/Installed\ Packages https://packagecontrol.io/Package%20Control.sublime-package
  fi
fi
