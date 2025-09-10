#!/bin/bash

# ==============================================================================
# csv_unzip.sh
#
# A script to perform the following actions in the current directory:
# 1. Unzip all .zip files, overwriting any existing files.
# 2. Delete the original .zip archives after extraction.
# 3. Rename all remaining files with a prefix based on the current date
#    (all_YYMMDD) and a sequential number.
#
# Usage:
#   Place this script in the directory with your .zip files and run it:
#   ./csv_unzip.sh
# ==============================================================================

# --- STEP 1: Unzip all archives ---
echo "Step 1: Unzipping all *.zip files..."

# Check if there are any zip files to prevent errors
if ls *.zip 1> /dev/null 2>&1; then
    for file in *.zip; do
        echo "  -> Unzipping '$file'..."
        unzip -o "$file" -d .
    done
    echo "Unzipping complete."
else
    echo "  -> No .zip files found to unzip."
fi
echo

# --- STEP 2: Remove the original zip files ---
echo "Step 2: Deleting original *.zip archives..."
# The -f flag suppresses errors if no .zip files are found
rm -f *.zip
echo "Deletion complete."
echo

# --- STEP 3: Rename extracted files ---
echo "Step 3: Renaming all remaining files..."

# Generate the prefix based on the current date in YYMMDD format
# For example, on September 10, 2025, this will be "all_250910"
prefix="all_$(date +%y%m%d)"
echo "  -> Using prefix: $prefix"

i=1
# Get the name of this script to avoid renaming it
script_name=$(basename "$0")

# Loop through all items in the directory
for file in *; do
  # Process only if it is a regular file and NOT this script itself
  if [ -f "$file" ] && [ "$file" != "$script_name" ]; then
    extension="${file##*.}"
    # Format the new name with a zero-padded 3-digit number
    printf -v new_name "%s_%03d.%s" "$prefix" "$i" "$extension"

    echo "  -> Renaming '$file' to '$new_name'"
    # The '--' prevents issues with filenames that start with a hyphen
    mv -- "$file" "$new_name"
    
    # Increment the counter for the next file
    ((i++))
  fi
done

echo "Renaming complete."
echo "All tasks finished!"