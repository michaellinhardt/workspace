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

# list all file names starting with "request" in ./dev and add a timestamp unix at the end, before the .md extension
for file in ./dev/request*; do
  if [ -f "$file" ]; then
	filename=$(basename -- "$file")
	extension="${filename##*.}"
	filename="${filename%.*}"
	timestamp=$(date +%s)
	new_filename="${filename}_${timestamp}.${extension}"
	mv "$file" "./dev/archived-requests/$new_filename"
  fi
done

# move all files from ./dev/request-* to ./dev/archived-requests
mv ./dev/request* ./dev/archived-requests/

# generate a new request "request.md" containing "# Request" and a new line
echo -e "# Request\n" > ./dev/request.md

echo "done"