#!/bin/bash

script_source="bin"
script_destination="/usr/local/bin"

man_source="docs/build/man"
man_destination="/usr/local/man/man1"

i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
Usage:
  ${0} [-i] [-u] [-h]

Description:
  スクリプトファイルとマニュアルページを
  インストール / アンインストールします。

Files:
  ${script_destination}: スクリプトファイルのインストール先。
  ${script_source}: インストールするスクリプトを収めたディレクトリ。

  ${man_destination}: マニュアルページのインストール先。
  ${man_source}: インストールするマニュアルを収めたディレクトリ。

Options:
  -i スクリプトファイルとマニュアルページをインストールします。
  -u スクリプトファイルとマニュアルページをアンインストールします。
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
  # スクリプトファイルのインストール
  for file in $script_list
  do
    source="${script_source}/${file}"
    install "$source" "$script_destination"
  done

  # マニュアルページのインストール
  which sphinx-build

  if [ $? -ne 0 ]; then
    provision_python_tools.sh -i
  fi

  (
    cd docs || exit 2
    make clean man
  )

  test_path.sh -c "$man_destination"

  if [ $? -ne 0 ]; then
    new_item.sh -d "$man_destination"
  fi

  man_list=$(ls "$man_source")

  for file in $man_list
  do
    source="${man_source}/${file}"
    gzip "$source"
    install "${source}.gz" "$man_destination" -m 0644
  done
elif [ $u_flag -eq 1 ]; then
  # スクリプトファイルのアンインストール
  for file in $script_list
  do
    rm "${script_destination}/${file}"
  done

  # マニュアルページのアンインストール
  man_list=$(ls "$man_source")

  for file in $man_list
  do
    source="${man_destination}/${file}"
    rm "${source}"
  done
fi
