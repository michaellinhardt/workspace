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
	echo $CW8"XCODE-SELECT validating license (need sudo)"$CWH
	sudo xcodebuild -license accept
	echo $CW8"XCODE-SELECT install"$CWH
fi

# caskInstall "NGROK" "ngrok"
brewInstall "TIG" "tig"
brewInstall "PYTHON" "python"
brewInstall "RUBY" "ruby"

brewInstall "NVM" "nvm"
brewInstall "NPM" "npm"

# COMMAND LINE TOOLS
# brewInstall "FTP-CLI" "inetutils"
# brewInstall "JQ-JSON-PARSER" "jq"

# REACT NATIVE DEVLOPMENT
# brewInstall "watchman" "watchman"
# brewTap "AdoptOpenJDK/openjdk"
# caskInstall "temurin" "temurin"

brewInstall "MYSQL" "mysql"
brewInstall "REDIS" "redis"
# caskInstall "MONGODB" "mongodb"

caskInstall "ITERM" "iterm2"

caskInstall "VSCODE" "visual-studio-code"
caskInstall "CHROME" "google-chrome"
# caskInstall "FIREFOX" "firefox"
caskInstall "ALFRED" "alfred"
# caskInstall "FRANZ" "franz"
# caskInstall "SKYPE" "skype"
# caskInstall "ZOOM" "zoom"
caskInstall "SPOTIFY" "spotify"
caskInstall "POSTMAN" "postman"
caskInstall "DBEAVER" "dbeaver-community"
caskInstall "KEEPING-YOU-AWAKE" "keepingyouawake"
# caskInstall "BETTER-TOUCH-TOOL" "bettertouchtool"
caskInstall "MACSFANCONTROL" "macs-fan-control"
# caskInstall "TRANSMISSION" "transmission"
caskInstall "VLC" "vlc"
caskInstall "NORDVPN" "nordvpn"
caskInstall "BITWARDEN" "bitwarden"
caskInstall "ONYX" "onyx"
# caskInstall "INTELLIJ" "intellij-idea"
# caskInstall "FORTICLIENT" "forticlient"

# caskInstall "GOOGLE-DRIVE" "google-drive"

echo $CRE"SNAP can't be auto installed"$CWH

echo $COK"Brew update all packages..."$CWH
brew upgrade &> /dev/null

echo $COK"Brew cleanup..."$CWH
brew cleanup &> /dev/null

echo $COK"Install Node with NVM"$CWH
nvm install --lts
