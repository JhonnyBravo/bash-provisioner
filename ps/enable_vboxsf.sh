#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
   enable_vboxsf.sh [-h]

Description:
   Virtual Box のゲスト OS へ共有ディレクトリへのアクセス権を付与します。

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

user_name="$1"
gpasswd -a "$user_name" vboxsf
