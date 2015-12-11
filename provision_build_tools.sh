#!/bin/bash

i_flag=0
u_flag=0

while getopts "iu" option
do
   case $option in
      i)
         i_flag=1
         ;;
      u)
         u_flag=1
         ;;
      \?)
         cat <<_EOT_
Usage:
   provision_build_tools.sh [-i] [-u]

Description:
   gcc, make をインストールまたはアンインストールします。

Options:
   -i gcc, make をインストールします。
   -u gcc, make をアンインストールします。
_EOT_
         exit 1
         ;;
   esac
done

if [ $i_flag -eq 1 ]; then
   apt-get install gcc make
elif [ $u_flag -eq 1 ]; then
   apt-get purge gcc make
fi
