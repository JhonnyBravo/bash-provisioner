#!/bin/bash

script_name=$(basename "$0")

u_path=".config/sublime-text-2/Packages/User/Package Control.sublime-settings"
d_path=".config/sublime-text-2/Packages/Package Control/Package Control.sublime-settings"

u_flag=0
d_flag=0

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-u] [-d] [-h]


DESCRIPTION:
       Package Control.sublime-settings を現在のディレクトリへコピーします。

OPTIONS:
       -u     ${u_path} をコピーします。

       -d     ${d_path} をコピーします。

       -h     ヘルプを表示します。
_EOT_
exit 1
}

while getopts "udh" option
do
  case $option in
    u)
      u_flag=1
      ;;
    d)
      d_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

if [ $u_flag -eq 1 ]; then
  cp ~/"${u_path}" ./
elif [ $d_flag -eq 1 ]; then
  cp ~/"${d_path}" ./
fi
