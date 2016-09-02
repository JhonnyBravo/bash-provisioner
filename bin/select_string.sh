#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       command | ${script_name} -in pattern
       ${script_name} -h


DESCRIPTION:
       パイプからの入力を受け取り、
       pattern に合致する行または合致しない行のみを表示します。

OPTIONS:
       -i pattern
              pattern に合致する行のみを表示します。

       -n pattern
              pattern に合致しない行のみを表示します。

       -h     ヘルプを表示します。
_EOT_
exit 1
}

i_flag=0
n_flag=0

while getopts "inh" option
do
  case $option in
    i)
      i_flag=1
      ;;
    n)
      n_flag=1
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
pattern="$1"

if [ -p /dev/stdin ]; then
  while IFS= read -r line
  do
    if [ $i_flag -eq 1 ]; then
      echo "$line" | grep "${pattern}"
    elif [ $n_flag -eq 1 ]; then
      echo "$line" | sed -e "/${pattern}/d"
    elif [ $i_flag -eq 0 ] && [ $n_flag -eq 0 ]; then
      usage
    fi
  done
else
  usage
fi
