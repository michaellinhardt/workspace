# GIT
git config --global core.editor vim
git config --global user.email "$MAIL"

# VIM
mkdir -p ~/.vim
cp -r $VIM_CONF/colors ~/.vim
echo "source $VIM_CONF/vimrc" > ~/.vimrc
