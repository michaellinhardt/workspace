#env_lib
My config files and some stuff

##files list
| repo path  | local path | description |
| ------------- | ------------- | ------------- |
| ./Makefile        | ~/42/Makefile | big guy |
| ./new/c/gitignore | ~/projet/.gitignore | prevent file from pushing |
| ./conf_file/zshrc | ~/.zshrc | backup zsh conf |
| ./conf_file/vimrc | ~/.vimrc | backup vim conf |
| ./conf_file/tmux.conf | ~/.tmux.conf | force use zsh at tmux start |


###usefull package
- zsh, terminal config
- ohmyzsh, improve zsh, install:
	- ```sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"```
- terminator, terminal multiplex app
- tmux,	plugin terminal multiplex (no gnomme/KDE)
- Sublivim, improve vim, install:
	- ```sudo curl -L http://install.ohmyz.sh | sh```
	- ```sudo curl https://raw.githubusercontent.com/reversTeam/Sublivim/master/installer.sh | sh```
- Skype install:
	- ```sudo add-apt-repository "deb http://archive.canonical.com/ $(lsb_release -sc) partner" && sudo apt-get update && sudo apt-get install skype```
