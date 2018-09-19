# GIT
git config --global core.editor vim
git config --global user.email "$MAIL"

# VIM
mkdir -p ~/.vim
cp -r ~/workspace/config/vim/colors ~/.vim
echo "source ~/workspace/config/vim/vimrc" > ~/.vimrc
