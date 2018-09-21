#!/bin/bash

mkdir -p ~/.vim
mkdir -p ~/.vim/autoload

if [ -f ~/.vim/autoload/plug.vim ]; then
	rm -rf ~/.vim/autoload/plug.vim
fi

curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
if [[ $? != 0 ]] ; then
  echo $CKO"PLUG.VIM install fail"$CWH
else
  echo $COK"PLUG.VIM install success"$CWH
fi

mkdir -p $VIM_PLUGGED
