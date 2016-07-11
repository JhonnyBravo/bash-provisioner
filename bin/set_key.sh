#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path key:value [-h]


DESCRIPTION:
       JSON ファイルのキーの値を更新します。

ARGUMENTS:
       path   JSON ファイルのパス。

       key:value
              キーの名前と新しい値。

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
key=$(echo "$2" | cut -f 1 -d :)
value=$(echo "$2" | cut -f 2 -d :)

mv "$path" "${path}.origin"
sed -e 's/\t/\  /g' <"${path}.origin" | \
sed -e "/${key}:/c \  ${key}:${value}" >"$path"
rm "${path}.origin"
