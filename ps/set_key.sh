#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  set_key.sh file_path key:value [-h]

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

file_path="$1"
key=$(echo "$2" | cut -f 1 -d :)
value=$(echo "$2" | cut -f 2 -d :)

mv "$file_path" "${file_path}.origin"
cat "${file_path}.origin" | sed -e 's/\t/\    /' | sed -e "/${key}:/c \    ${key}:${value}" >"$file_path"
rm "${file_path}.origin"
