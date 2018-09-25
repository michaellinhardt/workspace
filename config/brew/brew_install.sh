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

function isInstalled() {
	# var is empty
	if [[ -z "$1" ]]; then
		return 0;
	fi
	# test with which
	which -s $1
	if [[ $? == 0 ]] ; then
		return 1; 
	fi
	# check in Applications folder
	if ls /Applications/ | grep -i $1 &> /dev/null; then
		return  1;
	fi
	# check in user Application folder
	if ls ~/Applications/ | grep -i $1 &> /dev/null; then
		return 1;
	fi
	# check with brew if installed
	if brew ls --versions $1 &> /dev/null; then
		return 1;
	fi
	# check with brew cask if installed
	brew cask list $1 &> /dev/null
	if [[ $? == 0 ]]; then
		return 1;
	fi
	return 0;
}

function brewInstall () {
	if ! isInstalled $1 || ! isInstalled $2 || ! isInstalled $3; then
		echo $COK"$1 already installed"$CWH
		return 0
	fi

	echo $CW8"installing $1..."$CWH
	brew install $3$2
	if [[ $? != 0 ]] ; then
		echo $CKO"$1 install fail"$CWH
	else
		echo $COK"$1 install success"$CWH
	fi
}

function caskInstall () {
	if ! isInstalled $1 || ! isInstalled $2 || ! isInstalled $3; then
		echo $COK"$1 already installed"$CWH
		return 0
	fi

	echo $CW8"installing $1..."$CWH
	brew cask install $2 $3
	if [[ $? != 0 ]] ; then
		echo $CKO"$1 install fail"$CWH
	else
		echo $COK"$1 install success"$CWH
	fi
}



xcode-select --install &> /dev/null
if [[ $? != 0 ]] ; then
	echo $COK"XCODE-SELECT already installed"$CWH
else
	echo $CW8"XCODE-SELECT install"$CWH
fi

brewInstall "TIG" "tig"
brewInstall "CMAKE" "CMake"
brewInstall "CTAGS" "universal-ctags/universal-ctags/universal-ctags" "--HEAD"
cp $CTAGS_CONF/ctags ~/.ctags
brewInstall "PYTHON" "python"
brewInstall "RUBY" "ruby"
brewInstall "NODE" "node"
brewInstall "NPM" "npm"

caskInstall "ITERM" "iterm2"
caskInstall "NGROK" "ngrok"
caskInstall "CHROME" "google-chrome"
caskInstall "ALFRED" "alfred"
caskInstall "BETTER-TOUCH-TOOL" "BetterTouchTool"
caskInstall "GOOGLE-BACKUP-SYNC" "google-backup-and-sync" "backup"
caskInstall "FRANZ" "franz"
caskInstall "SPOTIFY" "spotify"
caskInstall "POSTMAN" "postman"
caskInstall "SEQUEL-PRO" "sequel-pro" "sequel"
# caskInstall "FIREFOX" "firefox"
# caskInstall "ATOM" "atom"
# caskInstall "VSCODE" "visual-studio-code"

echo $CRE"GITHUB-DESKTOP can't be auto installed"$CWH
echo $CRE"ANTISLEEP can't be auto installed"$CWH
echo $CRE"SNAP can't be auto installed"$CWH

echo $COK"Brew update all packages..."$CWH
brew upgrade &> /dev/null

echo $COK"Brew cleanup..."$CWH
brew cleanup &> /dev/null

