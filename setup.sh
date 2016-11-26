#!/bin/bash

script_source="bin"
script_destination="/usr/local/bin"

i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
Usage:
  ${0} [-i] [-u] [-h]

Description:
  スクリプトファイルをインストール / アンインストールします。

Files:
  ${script_destination}: スクリプトファイルのインストール先。
  ${script_source}: インストールするスクリプトを収めたディレクトリ。

Options:
  -i スクリプトファイルをインストールします。
  -u スクリプトファイルをアンインストールします。
  -h ヘルプを表示します。
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

script_list=$(ls "$script_source")

if [ $i_flag -eq 1 ]; then
  apt-get install ibus-mozc xdg-user-dirs-gtk

  # スクリプトファイルのインストール
  for file in $script_list
  do
    source="${script_source}/${file}"
    install "$source" "$script_destination"
  done

elif [ $u_flag -eq 1 ]; then
  # スクリプトファイルのアンインストール
  for file in $script_list
  do
    rm "${script_destination}/${file}"
  done
fi
