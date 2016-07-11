#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path value [-h]


DESCRIPTION:
       ファイルへ値を書き込みます。
       ファイルの内容が空ではない場合、既存の内容を削除して上書きします。

ARGUMENTS:
       path   値を書き込むファイルのパス。

       value  ファイルへ書き込む値。

OPTIONS:
       -h     ヘルプを表示します。
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
