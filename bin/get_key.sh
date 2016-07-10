#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path key [-h]


DESCRIPTION:
       JSON ファイルのキーの値を取得します。

ARGUMENTS:
       path   JSON ファイルのパス。

       key    JSON のキー。

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
key="$2"

grep -e "\"${key}\":" <"${path}" | cut -f 2 -d :
