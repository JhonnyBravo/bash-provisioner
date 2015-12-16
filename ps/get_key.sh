#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  get_key.sh file_path key [-h]

Description:
  JSON ファイルの key の値を取得します。

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
key="$2"

cat "${file_path}" | grep -e "\"${key}\":" | cut -f 2 -d :
