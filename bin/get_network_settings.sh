#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-h]


DESCRIPTION:
       現在のネットワーク設定を表示します。

OPTIONS:
       -h     ヘルプを表示します。
_EOT_
exit 1
}

while getopts "h" option
do
  case $option in
    h)
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

{
  echo '[ifconfig]'
  ifconfig
  echo '[route]'
  route -n
  echo
  echo '[resolv.conf]'
  cat /etc/resolv.conf
} | less
