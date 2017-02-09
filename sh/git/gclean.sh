#!/bin/bash

echo $CW8 $CYE"find ./ -name \".DS_Store\" -depth -exec rm {} \;"$CWH
find ./ -name ".DS_Store" -depth -exec rm {} \;
echo $COK $CGR "Done!"$CWH
exit 0;
