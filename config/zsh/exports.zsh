# DEFINE
export ZSH_CONF=~/workspace/config/zsh

# ZSH
export ZSH=~/.oh-my-zsh

ZSH_THEME="gallois"

# GIT
export MAIL=linhardt.michael@gmail.com
plugins=(git)

# SYSTEM
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/Applications/Atom.app/Contents/MacOS:/Users/mikaopenlife"

# CASK option to force install similink in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
