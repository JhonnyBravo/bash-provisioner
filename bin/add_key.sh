#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path key:value [-h]


DESCRIPTION:
       JSON ファイルへ新しい key:value を追加します。

ARGUMENTS:
       path   JSON ファイルのパス。

       key:value
              JSON ファイルへ追加するキーと値。

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
sed -e 's/\t/\  /g' <"${path}.origin" | sed -e "/^}/i \  ${key}" >"$path"
rm "${path}.origin"
