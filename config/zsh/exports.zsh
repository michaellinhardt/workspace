# PATH
export WORKSPACE_PATH=~/workspace

export WORKSPACE_CONF=$WORKSPACE_PATH/config
export FUNCTIONS_CONF=$WORKSPACE_CONF/functions
export BREW_CONF=$WORKSPACE_CONF/brew
export ZSH_CONF=$WORKSPACE_CONF/zsh
export NPM_CONF=$WORKSPACE_CONF/npm
export VSC_CONF=$WORKSPACE_CONF/vsc
export VSCODE_CONF=$WORKSPACE_CONF/vscode

# ZSH
export ZSH=~/.oh-my-zsh

ZSH_THEME="gallois"

# GIT
export MAIL=linhardt.michael@gmail.com
plugins=(git)

# SYSTEM
export PATH="/Users/teazyou/.gem/ruby/2.6.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/Applications/Atom.app/Contents/MacOS"

# CASK option to force install similink in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ANDROID SDK

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
