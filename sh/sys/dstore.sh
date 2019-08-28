#!/bin/bash

echo $CW8"find ./ -name \".DS_Store\" -depth -exec rm {} \;"$CWH
find ./ -name ".DS_Store" -depth -exec rm {} \;
echo $CW8"find ./ -name \"_DS_Store\" -depth -exec rm {} \;"$CWH
find ./ -name "_DS_Store" -depth -exec rm {} \;
echo $COK "Done!"$CWH
exit 0;
