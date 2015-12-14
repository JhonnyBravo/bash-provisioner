#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
   add_content.sh path value [-h]

Description:
   ファイルへ値を追記します。

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

path="$1"
value="$2"

echo "$value" >>"$path"
