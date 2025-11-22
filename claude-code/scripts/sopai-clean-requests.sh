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

# list all file names starting with "request" in ./dev and add a timestamp at the beginning
timestamp=$(date +%Y-%m-%dT%H-%M)
for file in ./dev/request*; do
  if [ -f "$file" ]; then
    # skip file if it only contains "# Request" (with optional whitespace)
    # remove all whitespace and compare
    content=$(cat "$file" | tr -d '[:space:]')
    if [ "$content" = "#Request" ]; then
      continue
    fi
    filename=$(basename -- "$file")
    new_filename="${timestamp}_${filename}"
    mv "$file" "./dev/archived-requests/$new_filename"
  fi
done

# generate a new request "request.md" containing "# Request" and a new line
printf "# Request\n" > ./dev/request.md

echo "done"