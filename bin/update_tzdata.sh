#!/bin/bash

script_name=$(basename "$0")

while getopts "h" option
do
  case $option in
    h)
      cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-h]


DESCRIPTION:
       タイムゾーンを設定します。

OPTIONS:
       -h     ヘルプを表示します。
_EOT_
      exit 1
      ;;
    \?)
      echo "-h オプションで使用法を確認してください。"
      exit 1
      ;;
  esac
done

dpkg-reconfigure tzdata
