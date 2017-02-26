#!/bin/bash

if [ $# -lt 1 ]
then
  echo $CKO $CRE"depot manquant!"$CWH
	exit 1
else
	arg=$*
fi

# Execute l'operation
echo $CW8 $CYE"git clone https://github.com/\""$arg"\""$CWH
git clone https://github.com/$arg
echo $COK $CGR"Done!"$CWH
exit 0
