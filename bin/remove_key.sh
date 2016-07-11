#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path key [-h]


DESCRIPTION:
       JSON ファイルからキーを削除します。

ARGUMENTS
       path   JSON ファイルのパス。

       key    削除するキーの名前。

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

mv "$path" "${path}.origin"
sed -e 's/\t/\  /g' <"${path}.origin" | sed -e "/\"${key}\":/d" >"$path"
rm "${path}.origin"
