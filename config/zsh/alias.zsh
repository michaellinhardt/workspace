# SHELL
reload () { source ~/.zshrc }
dstore () { sh ~/workspace/sh/sys/dstore.sh }

# APP
atom () { open -a atom $@ }

# NAVIGATION
workspace () { cd ~/workspace/$@ }
clevy () { cd ~/clevy/$@ }

# CONFIG
vimrc () { vim ~/workspace/config/vim/vimrc }
zshrc () { vim ~/workspace/config/zsh/zshrc && source ~/.zshrc }

# GIT
alias gad="git add $@"
alias gst="sh ~/workspace/sh/git/gstatus.sh"
alias gco="sh ~/workspace/sh/git/gcommit.sh"
alias gpu="sh ~/workspace/sh/git/gpush.sh"

alias gdelete="sh ~/workspace/sh/git/gdelete.sh"
alias gcreate="sh ~/workspace/sh/git/gcreate.sh"
alias gbranch="git remote prune origin && git branch -a"
