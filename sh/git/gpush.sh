#!/bin/bash

sh ~/workspace/sh/sys/dstore.sh
[[ $? != 0 ]] && exit 1;
sh ~/workspace/sh/git/gsetup.sh
[[ $? != 0 ]] && exit 1;
sh ~/workspace/sh/git/gstatus.sh
sh ~/workspace/sh/git/glint.sh
[[ $? != 0 ]] && exit 1;
# Si aucun argument transmit on push et c'est tout
echo $CW8 $CYE"git push"$CWH
git push
echo $COK $CGR"Done!"$CWH
exit 0
