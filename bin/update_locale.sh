#!/bin/bash

script_name=$(basename "$0")

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} [-h]


DESCRIPTION:
       /etc/locale.gen の変更をシステムへ適用します。

OPTIONS:
       -h     ヘルプを表示します。
_EOT_
exit 1
}

while getopts "ejh" option
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

locale-gen
localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"
source /etc/default/locale
echo $LANG
