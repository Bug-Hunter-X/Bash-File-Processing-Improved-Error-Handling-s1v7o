#!/bin/bash

# This script demonstrates how to properly handle errors in a loop.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  result=$(process_file "$file")
  if [[ $? -ne 0 ]]; then
    echo "Error processing $file: $result"
  else
    echo "Processed: $file"
  fi
done

process_file() {
  # Simulates file processing
  local file="$1"
  if [[ "$RANDOM" % 2 -eq 0 ]]; then
    echo "Processing $file... success!"
    return 0
  else
    echo "Processing $file... failure!"
    return 1
  fi
}
