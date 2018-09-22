#!/bin/bash

# OH-MY-ZSH
if [ -d "$ZSH" ]; then
  echo $COK"OH-MY-ZSH already installed"$CWH
else
  echo $CW8"installing OH-MY-ZSH..."$CWH
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null
  if [[ $? != 0 ]] ; then
    echo $CKO"OH-MY-ZSH install fail"$CWH
  else
    echo $COK"OH-MY-ZSH install success"$CWH
  fi
fi

# INSTALL BREW IF NEEDED
which -s brew
if [[ $? != 0 ]] ; then
  echo $CW8"installing HOMEBREW..."$CWH
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [[ $? != 0 ]] ; then
    echo $CKO"HOMEBREW install fail"$CWH
  else
    echo $COK"HOMEBREW install success"$CWH
  fi
else
  echo $CW8"updating HOMEBREW..."$CWH
  brew update &> /dev/null
  if [[ $? != 0 ]] ; then
    echo $CKO"HOMEBREW update fail"$CWH
  else
    echo $COK"HOMEBREW update success"$CWH
  fi
fi

function brewInstall () {
  if ! brew ls --versions $2 &> /dev/null; then
  	echo $CW8"installing $1..."$CWH
  	brew install $3$2

  	if [[ $? != 0 ]] ; then
      echo $CKO"$1 install fail"$CWH
    else
      echo $COK"$1 install success"$CWH
    fi

  else
  	echo $COK"$1 already installed"$CWH
  fi
}

function caskInstall () {
  brew cask list $2 &> /dev/null
  if [[ $? != 0 ]] ; then
  	echo $CW8"installing $1..."$CWH
    brew cask install $2
    if [[ $? != 0 ]] ; then
      echo $CKO"$1 install fail"$CWH
    else
      echo $COK"$1 install success"$CWH
    fi
  else
    echo $COK"$1 already installed"$CWH
  fi
}

brewInstall "TIG" "tig"
brewInstall "CMAKE" "CMake"
brewInstall "CTAG" "universal-ctags/universal-ctags/universal-ctags" "--HEAD"
brewInstall "PYTHON" "python"
brewInstall "RUBY" "ruby"
brewInstall "NODE" "node"
brewInstall "NPM" "npm"
sh $NPM_CONF/npm_install.sh

caskInstall "ITERM2" "iterm2"
caskInstall "NGROK" "ngrok"
caskInstall "CHROME" "google-chrome"
caskInstall "FIREFOX" "firefox"
caskInstall "ALFRED" "alfred"
caskInstall "BETTER-TOUCH-TOOL" "BetterTouchTool"
caskInstall "GOOGLE-BACKUP-SYNC" "google-backup-and-sync"
caskInstall "FRANZ" "franz"
# caskInstall "ATOM" "atom"
caskInstall "VSCODE" "visual-studio-code"
caskInstall "SPOTIFY" "spotify"
caskInstall "POSTMAN" "postman"
caskInstall "SEQUEL-PRO" "sequel-pro"

echo $CRE"GITHUB-DESKTOP can't be auto installed"$CWH
echo $CRE"ANTISLEEP can't be auto installed"$CWH
echo $CRE"SNAP can't be auto installed"$CWH

echo $COK"Brew update all packages..."$CWH
brew upgrade &> /dev/null

echo $COK"Brew cleanup..."$CWH
brew cleanup &> /dev/null

echo $CW8"Security: https://objective-see.com/products.html"$CWH
