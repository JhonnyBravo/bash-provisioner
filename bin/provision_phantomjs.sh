#!/bin/bash

script_name=$(basename "$0")

package="phantomjs"
url="https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-i686.tar.bz2"
source="phantomjs-2.1.1-linux-i686/bin/${package}"
destination="/usr/local/bin"

i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-i] [-u] [-h]


DESCRIPTION:
       ${package} をインストール / アンインストールします。

OPTIONS:
       -i     ${package} をインストールします。

       -u     ${package} をアンインストールします。

       -h     ヘルプを表示します。
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
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

if [ $i_flag -eq 1 ]; then
  wget "$url"
  tar jxf phantomjs-2.1.1-linux-i686.tar.bz2
  install "$source" "$destination"
  rm phantomjs-2.1.1-linux-i686.tar.bz2
  rm -R phantomjs-2.1.1-linux-i686
elif [ $u_flag -eq 1 ]; then
  rm "${destination}/${package}"
fi
