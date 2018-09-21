#!/bin/bash

mkdir -p ~/.vim
mkdir -p ~/.vim/autoload
if [ ! -d ~/.vim/autoload/plug.vim ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
