#!/bin/bash

echo $CW8"find ./ -name \".DS_Store\" -depth -exec rm {} \;"$CWH
find ./ -name ".DS_Store" -depth -exec rm {} \;
echo $COK "Done!"$CWH
exit 0;
