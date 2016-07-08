#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} path key [-h]

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

path="$1"
key="$2"

grep -e "\"${key}\":" <"${path}" | cut -f 2 -d :
