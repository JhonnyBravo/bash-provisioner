#!/bin/bash

script_name=$(basename "$0")

apt_pkg="python-pip python-sphinx python-tk"
py_pkg="pip-init autopep8 sphinx-intl"
package="${apt_pkg} ${py_pkg}"

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

function new_requirements_list(){
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
      usage
      ;;
    \?)
      usage
      ;;
  esac
done

if [ $i_flag -eq 1 ]; then
  new_requirements_list "$py_pkg" requirements.txt
  # shellcheck disable=SC2086
  apt-get install ${apt_pkg}
  pip install -r requirements.txt
  rm requirements.txt
elif [ $u_flag -eq 1 ]; then
  new_requirements_list "$py_pkg" requirements.txt
  pip uninstall -r requirements.txt
  # shellcheck disable=SC2086
  apt-get purge ${apt_pkg}
  rm requirements.txt
fi
