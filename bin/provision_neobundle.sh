#!/bin/bash
# Standalone installer for Unixs
# Original version is created by shoma2da
# https://github.com/shoma2da/neobundle_installer

# Installation directory
# vim config
BUNDLE_DIR=~/.vim/bundle
INSTALL_DIR="$BUNDLE_DIR/neobundle.vim"
VIMRC_PATH=~/.vim/vimrc

echo "$INSTALL_DIR"

if [ -e "$INSTALL_DIR" ]; then
  echo "$INSTALL_DIR already exists!"
fi

# nvim config
NVIM_DIR=~/.config/nvim
NVIM_BUNDLE_DIR="$NVIM_DIR/bundle"
NVIM_INSTALL_DIR="$NVIM_BUNDLE_DIR/neobundle.vim"
NVIM_INIT_PATH=~/.config/nvim/init.vim

# shell script config
script_name=$(basename "$0")

package=neobundle
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

# check option
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
  echo "$NVIM_INSTALL_DIR"

  if [ -e "$NVIM_INSTALL_DIR" ]; then
    echo "$NVIM_INSTALL_DIR already exists!"
  fi

  if [ -e "$INSTALL_DIR" ] && [ -e "$NVIM_INSTALL_DIR" ]; then
    exit 1
  fi

  # check git command
  if type git; then
    : # You have git command. No Problem.
  else
    echo 'Please install git or update your path to include the git executable!'
    exit 1
  fi

  # make bundle dir and fetch neobundle
  echo "Begin fetching NeoBundle..."

  if ! [ -e "$INSTALL_DIR" ]; then
    mkdir -p "$BUNDLE_DIR"
    git clone https://github.com/Shougo/neobundle.vim "$INSTALL_DIR"
  fi

  if type nvim > /dev/null 2>&1 && ! [ -e "$NVIM_INSTALL_DIR" ]; then
    mkdir -p "$NVIM_BUNDLE_DIR"
    git clone https://github.com/Shougo/neobundle.vim "$NVIM_INSTALL_DIR"
  fi

  echo "Done."

  # write initial setting for .vimrc
  echo "Please add the following settings for NeoBundle to the top of your .vimrc file:"
  {
    echo ""
    echo ""
    echo "\"NeoBundle Scripts-----------------------------"
    echo "if &compatible"
    echo "  set nocompatible               \" Be iMproved"
    echo "endif"
    echo ""
    echo "\" Required:"
    echo "set runtimepath^=$BUNDLE_DIR/neobundle.vim/"
    echo ""
    echo "\" Required:"
    echo "call neobundle#begin(expand('$BUNDLE_DIR'))"
    echo ""
    echo "\" Let NeoBundle manage NeoBundle"
    echo "\" Required:"
    echo "NeoBundleFetch 'Shougo/neobundle.vim'"
    echo ""
    echo "\" Add or remove your Bundles here:"
    echo "NeoBundle 'Shougo/neosnippet.vim'"
    echo "NeoBundle 'Shougo/neosnippet-snippets'"
    echo "NeoBundle 'tpope/vim-fugitive'"
    echo "NeoBundle 'ctrlpvim/ctrlp.vim'"
    echo "NeoBundle 'flazz/vim-colorschemes'"
    echo "NeoBundle 'editorconfig/editorconfig-vim'"
    echo ""
    echo "\" You can specify revision/branch/tag."
    echo "NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }"
    echo ""
    echo "\" Required:"
    echo "call neobundle#end()"
    echo ""
    echo "\" Required:"
    echo "filetype plugin indent on"
    echo ""
    echo "\" If there are uninstalled bundles found on startup,"
    echo "\" this will conveniently prompt you to install them."
    echo "NeoBundleCheck"
    echo "\"End NeoBundle Scripts-------------------------"
    echo ""
    echo ""
  } >> "$VIMRC_PATH"

  # write initial setting for ~/.config/nvim/init.vim
  if type nvim > /dev/null 2>&1; then
    echo "Please add the following settings for NeoBundle to the top of your init.vim file:"
    {
      echo ""
      echo ""
      echo "\"NeoBundle Scripts-----------------------------"
      echo "if has('vim_starting')"
      echo "  \" Required:"
      echo "  set runtimepath+=$NVIM_BUNDLE_DIR/neobundle.vim/"
      echo "endif"
      echo ""
      echo "\" Required:"
      echo "call neobundle#begin(expand('$NVIM_BUNDLE_DIR'))"
      echo ""
      echo "\" Let NeoBundle manage NeoBundle"
      echo "\" Required:"
      echo "NeoBundleFetch 'Shougo/neobundle.vim'"
      echo ""
      echo "\" Add or remove your Bundles here:"
      echo "NeoBundle 'Shougo/neosnippet.vim'"
      echo "NeoBundle 'Shougo/neosnippet-snippets'"
      echo "NeoBundle 'tpope/vim-fugitive'"
      echo "NeoBundle 'ctrlpvim/ctrlp.vim'"
      echo "NeoBundle 'flazz/vim-colorschemes'"
      echo "NeoBundle 'editorconfig/editorconfig-vim'"
      echo ""
      echo "\" You can specify revision/branch/tag."
      echo "NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }"
      echo ""
      echo "\" Required:"
      echo "call neobundle#end()"
      echo ""
      echo "\" Required:"
      echo "filetype plugin indent on"
      echo ""
      echo "\" If there are uninstalled bundles found on startup,"
      echo "\" this will conveniently prompt you to install them."
      echo "NeoBundleCheck"
      echo "\"End NeoBundle Scripts-------------------------"
      echo ""
      echo ""
    } >> "$NVIM_INIT_PATH"
  fi

  echo "Done."
  echo "Complete setup NeoBundle!"
elif [ $u_flag -eq 1 ]; then
  rm -Rf "$BUNDLE_DIR"

  if [ -e "$VIMRC_PATH" ]; then
    rm "$VIMRC_PATH"
  elif [ -e "$NVIM_INIT_PATH" ]; then
    rm "$NVIM_INIT_PATH"
  fi
fi
