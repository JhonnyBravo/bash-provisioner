#!/bin/bash

while getopts "h" option
do
  case $option in
    h)
      cat <<_EOT_
Usage:
  ${0} [-h]

Description:
  タイムゾーンを設定します。

Options:
  -h ヘルプを表示します。
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
