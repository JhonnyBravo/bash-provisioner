#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
   test_path.sh [-l] [-c] path [-h]

Description:
   path が実在すれば 0 を、存在しない場合は 1 を返します。
   オプションを省略した場合、 
   path がファイルであるかディレクトリであるかを区別せず、
   実在する path であれば 0 を返します。

Options:
   -l path path が実在し、かつファイルであれば 0 を返します。
   -c path path が実在し、かつディレクトリであれば 0 を返します。
   -h ヘルプを表示します。
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
   shift $(expr $OPTIND - 1)
   path="$1"
   test -f "${path}"
elif [ $c_flag -eq 1 ]; then
   shift $(expr $OPTIND - 1)
   path="$1"
   test -d "${path}"
elif [ $l_flag -eq 0 -a $c_flag -eq 0 ]; then
   path="$1"
   test -e "${path}"
fi
