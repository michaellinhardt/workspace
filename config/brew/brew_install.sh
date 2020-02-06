#!/bin/bash

. $FUNCTIONS_CONF/brew.sh

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

xcode-select --install &> /dev/null
if [[ $? != 0 ]] ; then
	echo $COK"XCODE-SELECT already installed"$CWH
else
	echo $CW8"XCODE-SELECT install"$CWH
fi

caskInstall "NGROK" "ngrok"
brewInstall "TIG" "tig"
brewInstall "PYTHON" "python"
brewInstall "RUBY" "ruby"

brewInstall "NODE" "node"
brewInstall "NPM" "npm"

# COMMAND LINE TOOLS
brewInstall "FTP-CLI" "inetutils"
brewInstall "JQ-JSON-PARSER" "jq"

# REACT NATIVE DEVLOPMENT
brewInstall "yarn" "yarn"
brewInstall "watchman" "watchman"
brewTap "AdoptOpenJDK/openjdk"
caskInstall "ADOPTOPEN-JDK8" "adoptopenjdk8"

brewInstall "MYSQL" "mysql"
caskInstall "MONGODB" "mongodb"

caskInstall "ITERM" "iterm2"

caskInstall "CHROME" "google-chrome"
caskInstall "ALFRED" "alfred"
caskInstall "FRANZ" "franz"
caskInstall "SPOTIFY" "spotify"
caskInstall "POSTMAN" "postman"
caskInstall "SEQUEL-PRO" "sequel-pro"

caskInstall "GOOGLE-BACKUP-SYNC" "google-backup-and-sync" "backup"

sh $VSCODE_CONF/vscode_install.sh

echo $CRE"GITHUB-DESKTOP can't be auto installed"$CWH
echo $CRE"ANTISLEEP can't be auto installed"$CWH
echo $CRE"SNAP can't be auto installed"$CWH

echo $COK"Brew update all packages..."$CWH
brew upgrade &> /dev/null

echo $COK"Brew cleanup..."$CWH
brew cleanup &> /dev/null
