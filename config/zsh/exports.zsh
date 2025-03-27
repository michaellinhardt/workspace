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
export GIT_NAME="Michael Linhardt"

# MYSQL
export DYLD_LIBRARY_PATH=/opt/homebrew/opt/openssl@1.1/lib:$DYLD_LIBRARY_PATH

# SYSTEM
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/homebrew/bin:/opt/homebrew/opt/mysql@8.4/bin:$PATH"

# CASK option to force install similink in /Applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Append nvm and npm binaries to PATH (nvm should be initialized first)
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

export PATH="$NVM_DIR/versions/node/$(nvm current)/bin:/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# MYSQL for compilers
export LDFLAGS="-L/opt/homebrew/opt/mysql@8.4/lib"
export CPPFLAGS="-I/opt/homebrew/opt/mysql@8.4/include"

# ANDROID SDK

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# REACT NATIVE REQS ( pod install related )
export LANG=en_US.UTF-8
