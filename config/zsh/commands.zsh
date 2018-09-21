# GIT
git config --global core.editor vim
git config --global user.email "$MAIL"

# VIM FOLDER
mkdir -p ~/.vim

# VIN COLORS
if [ ! -d ~/.vim/colors ]; then
	cp -r $VIM_CONF/colors ~/.vim
fi

# VIM VUNDLE
sh $VIM_CONF/plugvim_install.sh
