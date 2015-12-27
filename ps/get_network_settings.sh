#!/bin/bash

function usage(){
cat <<_EOT_
Usage:
  ${0} [-h]

Description:
  現在のネットワーク設定を表示します。

Options:
  -h ヘルプを表示します。
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
