#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
   set_content.sh path value [-h]

Description:
   ファイルへ値を書き込みます。
   ファイルの内容が空ではない場合、既存の内容を削除して上書きします。

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

echo "$value" >"$path"
