#!/bin/bash

u_path=".config/sublime-text-2/Packages/User/"

function usage(){
cat <<_EOT_
Usage:
  set_pkg_ctrl.sh path [-h]

Description:
  指定したファイルを User/Package Control.sublime-settings へコピーします。

Options:
  -h ヘルプを表示します。
_EOT_
exit 1
}

while getopts "h" option
do
  case $option in
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

cp "$1" ~/"${u_path}"
