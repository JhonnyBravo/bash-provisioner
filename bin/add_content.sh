#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path value [-h]


DESCRIPTION:
       ファイルへ値を追記します。

ARGUMENTS:
       path   値を追記するファイルのパス。

       value  ファイルへ追記する値。

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

echo "$value" >>"$path"
