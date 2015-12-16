#!/bin/bash

package="vim"
i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
Usage:
   provision_${1}.sh [-i] [-u] [-h]

Description:
   ${1} をインストール / アンインストールします。

Options:
   -i ${1} をインストールします。
   -u ${1} をアンインストールします。
   -h ヘルプを表示します。
_EOT_
exit 1
}

while getopts "iuh" option
do
   case $option in
      i)
         i_flag=1
         ;;
      u)
         u_flag=1
         ;;
      h)
         usage "$package"
         ;;
      \?)
         usage "$package"
         ;;
   esac
done

if [ $i_flag -eq 1 ]; then
   apt-get install $package
elif [ $u_flag -eq 1 ]; then
   apt-get purge $package
fi
