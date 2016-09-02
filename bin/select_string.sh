#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} -in pattern path
       ${script_name} -h


DESCRIPTION:
       path に指定したファイルを読み込み、
       pattern に合致する行または合致しない行のみを表示します。

OPTIONS:
       -i pattern path
              pattern に合致する行のみを表示します。

       -n pattern path
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
path="$2"

if [ $i_flag -eq 1 ]; then
  grep "${pattern}" <"$path"
elif [ $n_flag -eq 1 ]; then
  sed -e "/${pattern}/d" <"$path"
elif [ $i_flag -eq 0 ] && [ $n_flag -eq 0 ]; then
  usage
fi
