get_child_item.sh
=================

Usage:
------

.. productionlist::
   get_child_item.sh: get_child_item.sh [path] [-h]
                    : get_child_item.sh -i pattern [path]
                    : get_child_item.sh -e pattern [path]
 
.. program:: get_child_item.sh

Description:
------------

指定した path の配下にあるファイル / ディレクトリを一覧表示します。
path を省略した場合、現在のディレクトリ内に存在する
ファイル / ディレクトリを一覧表示します。

Arguments:
----------

.. option:: path

   ディレクトリのパス。

Options:
--------

.. option:: -i pattern  

   pattern に合致する名前を持つ
   ファイル / ディレクトリを一覧表示します。

.. option:: -e pattern 

   pattern に合致しない名前を持つ
   ファイル / ディレクトリを一覧表示します。

.. option:: -h 

   ヘルプを表示します。
