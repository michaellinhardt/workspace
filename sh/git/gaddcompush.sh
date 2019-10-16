#!/bin/bash

git add -A

sh ~/workspace/sh/git/gcommit.sh $*
[[ $? != 0 ]] && exit 1;
sh ~/workspace/sh/git/gpush.sh
[[ $? != 0 ]] && exit 1;

exit 0
