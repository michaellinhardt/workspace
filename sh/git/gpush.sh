#!/bin/bash

sh ~/42/workspace/sh/sys/dstore.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/git/gsetup.sh
[[ $? != 0 ]] && exit 1;
sh ~/42/workspace/sh/git/gstatus.sh
# Si aucun argument transmit on push et c'est tout
if [ $# -lt 1 ]
then
  echo $CW8 $CYE"git push"$CWH
  git push
  echo $COK $CGR"Done!"$CWH
  exit 0
else
  sh ~/42/workspace/sh/git/glint.sh
  [[ $? != 0 ]] && exit 1;
	commit=$*
  echo $CW8 $CYE"git add --all"
  git add --all
  echo $CW8 $CYE"git commit -m \""$commit"\""$CWH
  git commit -m "$commit"
  echo $CW8 $CYE"git push"$CWH
  git push
  echo $COK $CGR"Done!"$CWH
  exit 0
fi
