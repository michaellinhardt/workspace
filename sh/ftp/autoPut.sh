#!/bin/bash

# HOST, USER and PASSWORD are not set here, its private..

HOST=PRIVATE
USER=PRIVATE
PASSWORD=`echo PRIVATE | base64 --decode`
 
ftp -inv $HOST <<EOF
user $USER $PASSWORD
cd /
mput backend.json
bye
EOF
