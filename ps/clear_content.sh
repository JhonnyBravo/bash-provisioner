#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
   clear_content.sh path [-h]

Description:
   ファイルの内容を削除します。

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
value=""

echo "$value" >"$path"
