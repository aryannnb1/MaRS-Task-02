#!/bin/bash

# Function to append the current date and time to the end of each file
function append_datetime() {
  local dir=$1
  local current_datetime=$(date +"%Y-%m-%d_%H-%M-%S")

  # Iterate over each file in the directory
  for file in "$dir"/*; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
      # Append the current date and time to the file
      echo "$current_datetime" >> "$file"
      echo "Appended date and time to: $file"
    fi
  done
}

# Prompt the user to enter the directory path
read -p "Enter the directory path: " dir

# Call the append_datetime function with the provided directory as input
append_datetime "$dir"

