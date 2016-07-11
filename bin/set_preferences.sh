#!/bin/bash

script_name=$(basename "$0")
u_path=".config/sublime-text-2/Packages/User/"

function usage(){
cat <<_EOT_
NAME
       ${script_name}

USAGE:
       ${script_name} path [-h]


DESCRIPTION:
       指定したファイルを ${u_path} へコピーします。

ARGUMENTS:
       path   コピーするファイルのパス。

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

cp "$1" ~/"${u_path}"
