#!/bin/bash

# CREATE CONF VIM FOLDER
mkdir -p ~/.vim

# IMPORT VIN COLORS SCHEMES
if [ ! -d ~/.vim/colors ]; then
	cp -r $VIM_CONF/colors ~/.vim
  if [[ $? != 0 ]] ; then
    echo $CKO"import ~/.vim/colors fail"$CWH
  else
    echo $COK"import ~/.vim/colors success"$CWH
  fi
else
  echo $COK"~/.vim/colors already exist"$CWH
fi

# VIM PLUG (PACKAGE MANAGER)
sh $VIM_CONF/vimplug_install.sh

# FORCE VIM TO START AND INSTALL PLUGIN
echo "source $VIM_CONF/vimrc\nPlugInstall" > ~/.vimrc
vim $VIM_CONF/do_not_touch
if [[ $? != 0 ]] ; then
  echo $CKO"open vim and install plugin fail"$CWH
else
  echo $COK"open vim and install plugin success"$CWH

  $VIM_PLUGGED/youcompleteme/install.py
  if [[ $? != 0 ]] ; then
    echo $CKO"YOUCOMPLETEME install fail"$CWH
  else
    echo $COK"YOUCOMPLETEME install success"$CWH
  fi
fi

# IMPORT VIM CONFIG TO VIM
echo "source $VIM_CONF/vimrc" > ~/.vimrc
if [[ $? != 0 ]] ; then
  echo $CKO"import ~/.vimrc fail"$CWH
else
  echo $COK"import ~/.vimrc success"$CWH
fi
