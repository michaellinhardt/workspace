#!/bin/bash

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

function brewTap () {
	echo $CW8"Brew tap $1"$CWH
	brew tap $1
	if [[ $? != 0 ]] ; then
		echo $CKO"$1 tap fail"$CWH
	else
		echo $COK"$1 tap success"$CWH
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
