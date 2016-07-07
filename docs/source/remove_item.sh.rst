remove_item.sh
==============

Usage:
------

.. productionlist::
   remove_item.sh: remove_item.sh [-r] path [-h]

.. program:: remove_item.sh

Description:
------------

ファイル / ディレクトリを削除します。

Arguments:
----------

.. option:: path

   削除するファイル / ディレクトリのパス。
   :option:`remove_item.sh -r` を指定しない場合は
   ディレクトリが空である場合に限り、ディレクトリの削除を実行します。

Options:
--------

.. option:: -r 

   ディレクトリを再帰的に削除します。ディレクトリが空ではない場合、
   残っているファイル / ディレクトリも含めて削除します。

.. option:: -h 

   ヘルプを表示します。
