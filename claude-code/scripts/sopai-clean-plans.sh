#!/bin/bash

echo "Cleaning plans..."

########################################
# Archives all plans
########################################

# stop script if no folder ./dev or ./dev/plans or ./dev/archived-plans or .dev/plans is empty
if [ ! -d "./dev" ] || [ ! -d "./dev/plans" ] || [ -z "$(ls -A ./dev/plans)" ]; then
  echo "No folder dev/plans or no plans to archive."
  exit 0
fi

# create the folder ./dev/archived-plans if not exists
if [ ! -d "./dev/archived-plans" ]; then
  mkdir -p "./dev/archived-plans"
fi

# move all files from ./dev/plans to ./dev/archived-plans with timestamp at the beginning (excluding archived-plan dir)
timestamp=$(date +%Y-%m-%dT%H-%M)
for file in ./dev/plans/*; do
  if [ -f "$file" ]; then
    filename=$(basename -- "$file")
    new_filename="${timestamp}_${filename}"
    mv "$file" "./dev/archived-plans/$new_filename"
  fi
done

echo "done"