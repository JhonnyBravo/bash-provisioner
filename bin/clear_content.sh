#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path [-h]


DESCRIPTION:
       ファイルの内容を削除します。

ARGUMENTS
       path   内容を削除するファイルのパス。

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
value=""

echo "$value" >"$path"
