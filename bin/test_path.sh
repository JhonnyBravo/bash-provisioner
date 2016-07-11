#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path
       ${script_name} [-l path] [-c path] [-h]


DESCRIPTION:
       パスが実在すれば 0 を、存在しない場合は 1 を返します。
       オプションを省略した場合、
       パスがファイルであるかディレクトリであるかを区別せず、
       実在するパスであれば 0 を返します。

OPTIONS:
       -l path
              パスが実在し、かつファイルであれば 0 を返します。

       -c path
              パスが実在し、かつディレクトリであれば 0 を返します。

       -h     ヘルプを表示します。
_EOT_
exit 1
}

l_flag=0
c_flag=0

while getopts "lch" option
do
  case $option in
    l)
      l_flag=1
      ;;
    c)
      c_flag=1
      ;;
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

if [ $l_flag -eq 1 ]; then
  shift $((OPTIND - 1))
  path="$1"
  test -f "${path}"
elif [ $c_flag -eq 1 ]; then
  shift $((OPTIND - 1))
  path="$1"
  test -d "${path}"
elif [ $l_flag -eq 0 -a $c_flag -eq 0 ]; then
  path="$1"
  test -e "${path}"
fi
