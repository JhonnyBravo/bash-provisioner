#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} -f path [value]
       ${script_name} -d path
       ${script_name} -h


DESCRIPTION:
       ファイル / ディレクトリを新規作成します。

OPTIONS:
       -f path [value]
              新規ファイルを作成します。
              value を省略した場合、空のファイルを作成します。

       -d path
              新規ディレクトリを作成します。

       -h     ヘルプを表示します。
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
