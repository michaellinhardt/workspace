# SHELL
reload () { source ~/.zshrc }
dstore () { sh $WORKSPACE_PATH/sh/sys/dstore.sh }

# NAVIGATION
workspace () { cd $WORKSPACE_PATH/$@ }
ec2 () { ssh -i ~/gdrive/AWS/ec2-virginia-prestoyou.pem ubuntu@ec2-54-82-197-76.compute-1.amazonaws.com }
ios () { cd ~/dev/presto/app_presto && npm run ios }
ios6 () { cd ~/dev/presto/app_presto && npm run ios6 }
backend () { cd ~/dev/presto/backend_presto/$@ }
app () { cd ~/dev/presto/app_presto/$@ }
apns () { cd ~/dev/presto/app_presto && xcrun simctl push booted com.prestoconnect.app apns.payload.json }
website () { cd ~/dev/presto/website_presto/$@ }
www () { cd /var/www/html }
dev () { cd ~/dev/$@ }

# CONFIG
vimrc () { vim $VIM_CONF/vimrc }
vimrc_remap () { vim $VIM_CONF/vimrc_remap }
vimrc_plugvim () { vim $VIM_CONF/vimrc_plugvim }
zshrc () { vim $ZSH_CONF/zshrc && source ~/.zshrc }

# VSCODE
alias vscode="open -a Visual\ Studio\ Code $@"
alias vsc="open -a Visual\ Studio\ Code $@"

# GIT
alias gad="git add $@"
alias gst="sh $WORKSPACE_PATH/sh/git/gstatus.sh"
alias gco="sh $WORKSPACE_PATH/sh/git/gcommit.sh"
alias gpu="sh $WORKSPACE_PATH/sh/git/gpush.sh"

alias gdelete="sh $WORKSPACE_PATH/sh/git/gdelete.sh"
alias gcreate="sh $WORKSPACE_PATH/sh/git/gcreate.sh"
alias gbranch="git remote prune origin && git branch -a"

# INSTALL WORKSPACE
alias install-brew="sh $BREW_CONF/brew_install.sh"
alias install-npm="sh $NPM_CONF/npm_install.sh"
alias install-vsc="sh $VSC_CONF/vsc_install.sh"
alias install-all="sh $BREW_CONF/brew_install.sh && sh $NPM_CONF/npm_install.sh && sh $VSC_CONF/vsc_install.sh"

# DKT FOLDERS
dkt () { cd ~/dev/dkt/$@ }
cd_headless_beauty () { cd ~/dev/dkt/headless_beauty/$@ }
cd_pim_mike () { cd ~/dev/dkt/pim_mike/$@ }
start_pim_mike () { cd ~/dev/dkt/autorun_pim_mike && osascript ./split_and_run.scpt "$(pwd)" }

# DKT SERVERS
start_healdless_beauty () { cd ~/dev/dkt/headless_beauty && nvm use 12.22.10 && npm run dev }
