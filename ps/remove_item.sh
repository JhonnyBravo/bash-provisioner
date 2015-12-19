#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} [-r] path [-h]

Description:
  ファイル / ディレクトリを削除します。
  ディレクトリが空ではない場合、ディレクトリの削除は失敗します。

Options:
  -r ディレクトリを再帰的に削除します。ディレクトリが空ではない場合、
     残っているファイル / ディレクトリも含めて削除します。
  -h ヘルプを表示します。
_EOT_
exit 1
}

r_flag=0

while getopts "r:h" option
do
  case $option in
    r)
      r_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

path="$1"

if [ -f "$path" ]; then
  rm "$path"
elif [ -d "$path" ]; then
  rmdir "$path"
elif [ $r_flag -eq 1 ]; then
  shift $((OPTIND - 2))
  path="$1"
  rm -R "$path"
fi
