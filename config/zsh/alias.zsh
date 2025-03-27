# SHELL
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

ssh_lightsail_restart () {
  INSTANCE_NAME="dktvnwordpress"

  echo "aws lightsail stop-instance --instance-name $INSTANCE_NAME > /dev/null"
  aws lightsail stop-instance --instance-name $INSTANCE_NAME > /dev/null
  
  # Wait until the instance is stopped
  while state=$(aws lightsail get-instance-state --instance-name $INSTANCE_NAME --query "state.name" --output text); [ "$state" != "stopped" ]; do
    echo "Waiting for instance to [stop]. Current state: $state"
    sleep 5
  done
  
  echo "aws lightsail start-instance --instance-name $INSTANCE_NAME > /dev/null"
  aws lightsail start-instance --instance-name $INSTANCE_NAME > /dev/null

  # Wait until the instance is running
  while state=$(aws lightsail get-instance-state --instance-name $INSTANCE_NAME --query "state.name" --output text); [ "$state" != "running" ]; do
    echo "Waiting for instance to [start]. Current state: $state"
    sleep 5
  done
  
  echo "Instance is running."
}

ssh_dktvnblog_restart () {
  echo "aws ec2 stop-instances --instance-ids i-0a98eb3189888fc95 > /dev/null"
  aws ec2 stop-instances --instance-ids i-0a98eb3189888fc95 > /dev/null
  
  # Wait until the instance is stopped
  while state=$(aws ec2 describe-instances --instance-ids i-0a98eb3189888fc95 --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "stopped" ]; do
    echo "Waiting for instance to [stop]. Current state: $state"
    sleep 5
  done
  
  echo "aws ec2 start-instances --instance-ids i-0a98eb3189888fc95 > /dev/null"
  aws ec2 start-instances --instance-ids i-0a98eb3189888fc95 > /dev/null

  # Wait until the instance is running
  while state=$(aws ec2 describe-instances --instance-ids i-0a98eb3189888fc95 --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "running" ]; do
    echo "Waiting for instance to [start]. Current state: $state"
    sleep 5
  done
  
  echo "Instance is running."
}

ssh_dktvnorders_restart () {
  echo "aws ec2 stop-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null"
  aws ec2 stop-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null
  
  # Wait until the instance is stopped
  while state=$(aws ec2 describe-instances --instance-ids i-0555cc0f0c5e3fffa --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "stopped" ]; do
    echo "Waiting for instance to [stop]. Current state: $state"
    sleep 5
  done
  
  echo "aws ec2 start-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null"
  aws ec2 start-instances --instance-ids i-0555cc0f0c5e3fffa > /dev/null

  # Wait until the instance is running
  while state=$(aws ec2 describe-instances --instance-ids i-0555cc0f0c5e3fffa --query "Reservations[*].Instances[*].State.Name" --output text); [ "$state" != "running" ]; do
    echo "Waiting for instance to [start]. Current state: $state"
    sleep 5
  done
  
  echo "Instance is running."
}

ssh_dktvnorders () { ssh -i ~/keys/2024.01.30-DKTVNOrders.pem ubuntu@ec2-47-128-207-99.ap-southeast-1.compute.amazonaws.com }
ssh_dktvnblog () { ssh -i ~/keys/2024.01.30-DKTVNOrders.pem ubuntu@ec2-3-1-0-199.ap-southeast-1.compute.amazonaws.com }
ssh_lightsail () { ssh -i ~/dev/secret-keys/aws-keys-michael-linhardt-decathlon/lightsail-dktvnwordpress.pem bitnami@dktvnblog.com }

# DKT FOLDERS
dkt () { cd ~/dev/dkt/$@ }
cd_headless_beauty () { cd ~/dev/dkt/headless_beauty/$@ }
cd_pim_mike () { cd ~/dev/dkt/pim_mike/$@ }
cd_posdata_fetcher () { cd ~/dev/nodejs_posdata_aeon/$@ }
start_pim_mike () { cd ~/dev/dkt/autorun_pim_mike && osascript ./split_and_run.scpt "$(pwd)" }
start_posdata_fetcher () { cd ~/dev/nodejs_posdata_aeon }

# DKT SERVERS
start_healdless_beauty () { cd ~/dev/dkt/headless_beauty && nvm use 12.22.10 && npm run dev }
