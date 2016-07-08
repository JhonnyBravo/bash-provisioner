#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} path key:value [-h]

Description:
  JSON ファイルの key の値を更新します。

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
key=$(echo "$2" | cut -f 1 -d :)
value=$(echo "$2" | cut -f 2 -d :)

mv "$path" "${path}.origin"
sed -e 's/\t/\  /g' <"${path}.origin" | \
sed -e "/${key}:/c \  ${key}:${value}" >"$path"
rm "${path}.origin"
