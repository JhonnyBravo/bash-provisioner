#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} [-f path [value]] [-d path] [-h]

Description:
  ファイル / ディレクトリを新規作成します。

Options:
  -f path [value]  新規ファイルを作成します。
                   value を省略した場合、空のファイルを作成します。
  -d path  新規ディレクトリを作成します。
  -h ヘルプを表示します。
_EOT_
exit 1
}

f_flag=0
d_flag=0

while getopts "f:d:h" option
do
  case $option in
    f)
      f_flag=1
      ;;
    d)
      d_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

shift $((OPTIND - 2))
path="$1"

if [ $f_flag -eq 1 ]; then
  value="$2"
  echo "$value" >"$path"
elif [ $d_flag -eq 1 ]; then
  mkdir -p "$path"
fi
