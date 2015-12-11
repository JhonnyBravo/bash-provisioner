#!/bin/bash

package="git"
i_flag=0
u_flag=0
c_flag=0

while getopts "iuc" option
do
   case $option in
      i)
         i_flag=1
         ;;
      u)
         u_flag=1
         ;;
      c)
         c_flag=1
         ;;
      \?)
         cat <<_EOT_
Usage:
   provision_${package}.sh [-i] [-u] [-c]

Description:
   ${package} をインストール、アンインストール、
   または ${package} へユーザ情報を登録します。

Options:
   -i ${package} をインストールします。
   -u ${package} をアンインストールします。
   -c ${package} へユーザ情報を登録します。
_EOT_
         exit 1
         ;;
   esac
done

if [ $i_flag -eq 1 ]; then
   apt-get install "$package"
elif [ $u_flag -eq 1 ]; then
   apt-get purge "$package"
elif [ $c_flag -eq 1 ]; then
   echo -n "ユーザ名を入力してください: "
   read name

   echo -n "E mail アドレスを入力してください: "
   read email

   git config --global color.ui auto
   git config --global user.name "$name"
   git config --global user.email "$email"
fi
