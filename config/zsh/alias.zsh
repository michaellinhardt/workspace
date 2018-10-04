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
vimrc_remap () { vim $VIM_CONF/vimrc_remap }
vimrc_plugvim () { vim $VIM_CONF/vimrc_plugvim }
zshrc () { vim $ZSH_CONF/zshrc && source ~/.zshrc }

# GIT
alias gad="git add $@"
alias gst="sh $WORKSPACE_PATH/sh/git/gstatus.sh"
alias gco="sh $WORKSPACE_PATH/sh/git/gcommit.sh"
alias gpu="sh $WORKSPACE_PATH/sh/git/gpush.sh"

alias gdelete="sh $WORKSPACE_PATH/sh/git/gdelete.sh"
alias gcreate="sh $WORKSPACE_PATH/sh/git/gcreate.sh"
alias gbranch="git remote prune origin && git branch -a"
alias grebase="git fetch && git rebase && git pull"
alias gsub="git submodule update --init"

# INSTALL WORKSPACE
alias install-brew="sh $BREW_CONF/brew_install.sh"
alias install-npm="sh $NPM_CONF/npm_install.sh"
alias install-vim="sh $VIM_CONF/vim_install.sh"
alias install-all="sh $BREW_CONF/brew_install.sh && sh $NPM_CONF/npm_install.sh && sh $VIM_CONF/vim_install.sh"

# CTAGS
alias tags="ctags -R -f ./.git/tags ."
