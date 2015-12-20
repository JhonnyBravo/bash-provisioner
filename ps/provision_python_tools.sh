#!/bin/bash

apt_pkg="python-pip python-sphinx python-tk"
py_pkg="pip-init autopep8"
i_flag=0
u_flag=0

function usage(){
cat <<_EOT_
Usage:
  ${0} [-i] [-u] [-h]

Description:
  ${1}
  をインストール / アンインストールします。

Options:
  -i ${1}
     をインストールします。
  -u ${1}
     をアンインストールします。
  -h ヘルプを表示します。
_EOT_
exit 1
}

function requirements(){
  for pkg in $1;
  do
    echo "$pkg" >>"$2"
  done
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
      usage "${apt_pkg} ${py_pkg}"
      ;;
    \?)
      usage "${apt_pkg} ${py_pkg}"
      ;;
  esac
done

if [ $i_flag -eq 1 ]; then
  requirements "$py_pkg" requirements.txt
  # shellcheck disable=SC2086
  apt-get install ${apt_pkg}
  pip install -r requirements.txt
  rm requirements.txt
elif [ $u_flag -eq 1 ]; then
  requirements "$py_pkg" requirements.txt
  pip uninstall -r requirements.txt
  # shellcheck disable=SC2086
  apt-get purge ${apt_pkg}
  rm requirements.txt
fi
