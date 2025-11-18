#!/bin/bash

echo "Cleaning plans..."

########################################
# Archives all plans
########################################

# stop script if no folder ./dev or ./dev/plans or ./dev/plans/archived or .dev/plans is empty
if [ ! -d "./dev" ] || [ ! -d "./dev/plans" ] || [ -z "$(ls -A ./dev/plans)" ]; then
  echo "No folder dev/plans or no plans to archive."
  exit 0
fi

# create the folder ./dev/plans/archived if not exists
if [ ! -d "./dev/plans/archived" ]; then
  mkdir -p "./dev/plans/archived"
fi

# move all files from ./dev/plans to ./dev/plans/archived
mv ./dev/plans/* ./dev/plans/archived/

echo "done"