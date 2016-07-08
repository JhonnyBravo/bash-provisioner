#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} path key:value [-h]

Description:
  JSON ファイルへ新しい key:value を追加します。

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
key="$2"

mv "$path" "${path}.origin"
sed -e 's/\t/\  /g' <"${path}.origin" | sed -e "/^}/i \  ${key}" >"$path"
rm "${path}.origin"
