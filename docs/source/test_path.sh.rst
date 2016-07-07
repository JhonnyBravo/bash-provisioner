test_path.sh
============

Usage:
------

.. productionlist::
   test_path.sh: test_path.sh path
               : test_path.sh [-l path] [-c path] [-h]

.. program:: test_path.sh

Description:
------------

パスが実在すれば 0 を、存在しない場合は 1 を返します。
オプションを省略した場合、 
パスがファイルであるかディレクトリであるかを区別せず、
実在するパスであれば 0 を返します。

Options:
--------

.. option:: -l path  

   パスが実在し、かつファイルであれば 0 を返します。

.. option:: -c path  

   パスが実在し、かつディレクトリであれば 0 を返します。

.. option:: -h 

   ヘルプを表示します。
