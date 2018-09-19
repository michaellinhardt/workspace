# SHELL
reload () { source ~/.zshrc }
dstore () { sh $WORKSPACE_PATH/sh/sys/dstore.sh }

# APP
atom () { open -a atom $@ }

# NAVIGATION
workspace () { cd $WORKSPACE_PATH/$@ }
clevy () { cd ~/clevy/$@ }

# CONFIG
vimrc () { vim $VIM_CONF/vimrc }
zshrc () { vim $ZSH_CONF/zshrc && source ~/.zshrc }

# GIT
alias gad="git add $@"
alias gst="sh $WORKSPACE_PATH/sh/git/gstatus.sh"
alias gco="sh $WORKSPACE_PATH/sh/git/gcommit.sh"
alias gpu="sh $WORKSPACE_PATH/sh/git/gpush.sh"

alias gdelete="sh $WORKSPACE_PATH/sh/git/gdelete.sh"
alias gcreate="sh $WORKSPACE_PATH/sh/git/gcreate.sh"
alias gbranch="git remote prune origin && git branch -a"
