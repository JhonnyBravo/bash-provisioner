#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} -lp path
       ${script_name} -h


DESCRIPTION:
       パスの末尾、またはパスの親ディレクトリを返します。

OPTIONS:
       -l path
              パスの末尾を返します。

       -p path
              パスの親ディレクトリを返します。

       -h     ヘルプを表示します。
_EOT_
exit 1
}

l_flag=0
p_flag=0

while getopts "lph" option
do
  case $option in
    l)
      l_flag=1
      ;;
    p)
      p_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

shift $((OPTIND - 1))
path="$1"

if [ $l_flag -eq 1 ]; then
  basename "${path}"
elif [ $p_flag -eq 1 ]; then
  dirname "${path}"
elif [ $l_flag -eq 0 ] && [ $p_flag -eq 0 ]; then
  usage
fi
