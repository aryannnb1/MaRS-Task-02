#!/bin/bash

# Function to transpose a matrix and print in standard 2D matrix format
function transpose_matrix() {
  local file=$1
  local matrix=()
  while IFS= read -r line; do
    matrix+=("$line")
  done < "$file"
  
  local transpose=()
  local rows=${#matrix[@]}
  local columns=$(echo "${matrix[0]}" | wc -w)
  
  for ((j = 0; j < columns; j++)); do
    local transposed_row=""
    for ((i = 0; i < rows; i++)); do
      local element=$(echo "${matrix[$i]}" | awk -v j=$((j + 1)) '{print $j}')
      transposed_row+=" $element"
    done
    transpose+=("$transposed_row")
  done
  
  echo "Transposed matrix:"
  for ((i = 0; i < columns; i++)); do
    echo "${transpose[$i]}"
  done
}

# Prompt the user to enter the file path
read -p "Enter the file path: " file

# Call the transpose_matrix function with the provided file as input
transpose_matrix "$file"

