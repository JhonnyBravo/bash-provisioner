#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} path key [-h]

Description:
  JSON ファイルから key を削除します。

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
sed -e 's/\t/\  /g' <"${path}.origin" | sed -e "/\"${key}\":/d" >"$path"
rm "${path}.origin"
