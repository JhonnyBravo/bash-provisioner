#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  remove_key.sh file_path key [-h]

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

file_path="$1"
key="$2"

mv "$file_path" "${file_path}.origin"
sed -e 's/\t/\    /' <"${file_path}.origin" | sed -e "/\"${key}\":/d" >"$file_path"
rm "${file_path}.origin"
