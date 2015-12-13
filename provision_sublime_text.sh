#!/bin/bash

package="sublime-text ibus-mozc emacs-mozc"
i_flag=0
u_flag=0
p_flag=0

function usage(){
cat <<_EOT_
Usage:
   provision_sublime_text.sh [-i] [-u] [-p] [-h]

Description:
   ${1} をインストール / アンインストールします。

Options:
   -i ${1} をインストールします。
   -u ${1} をアンインストールします。
   -p Package Control.sublime-package をインストールします。
   -h ヘルプを表示します。
_EOT_
exit 1
}

while getopts "iuph" option
do
   case $option in
      i)
         i_flag=1
         ;;
      u)
         u_flag=1
         ;;
      p)
         p_flag=1
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
   sublime-text -h

   if [ $? -ne 0 ]; then
      add-apt-repository ppa:webupd8team/sublime-text-2
      apt-get update
   fi

   apt-get install $package
elif [ $u_flag -eq 1 ]; then
   apt-get purge $package
elif [ $p_flag -eq 1 ]; then
   sublime-text -h

   if [ $? -eq 0 ]; then
      wget -P ~/.config/sublime-text-2/Installed\ Packages https://packagecontrol.io/Package%20Control.sublime-package
   fi
fi
