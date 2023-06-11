#!/bin/bash

# Function to recursively search for files with .txt extension and copy them to the Modified directory
function copy_files() {
  local dir=$1
  local modified_dir="$dir/Modified"

  # Check if the Modified directory exists, if not, create it
  if [ ! -d "$modified_dir" ]; then
    mkdir "$modified_dir"
  fi

  # Find all files with .txt extension and copy them to the Modified directory with .bak extension
  find "$dir" -type f -name "*.txt" -exec cp {} "$modified_dir"/ \;
  for file in "$modified_dir"/*.txt; do
    mv "$file" "${file%.txt}.bak"
  done
  echo "Files with .txt extension copied to the Modified directory with .bak extension."
}

# Prompt the user to enter the current working directory
read -p "Enter the Current Working Directory: " cwd

# Call the copy_files function with the provided directory as input
copy_files "$cwd"

