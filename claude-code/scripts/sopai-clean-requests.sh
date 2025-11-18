#!/bin/bash

echo "Cleaning requests..."

########################################
# Archives all requests
########################################

# stop script if no folder ./dev
if [ ! -d "./dev" ]; then
  echo "No folder dev."
  exit 0
fi

# create the folder ./dev/archived-requests if not exists
if [ ! -d "./dev/archived-requests" ]; then
  mkdir -p "./dev/archived-requests"
fi

# move all files from ./dev/request-* to ./dev/archived-requests
mv ./dev/request* ./dev/archived-requests/

# generate a new request "request.md" containing "# Request" and a new line
echo -e "# Request\n" > ./dev/request.md

echo "done"