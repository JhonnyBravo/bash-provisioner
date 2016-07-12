#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       command | ${script_name}
       ${script_name} [-h]


DESCRIPTION:
       パイプから入力を受取り、行頭のスペースを削除して標準出力へ返します。

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

if [ -p /dev/stdin ]; then
  while read line
  do
    echo "$line"
  done
else
  usage
fi
