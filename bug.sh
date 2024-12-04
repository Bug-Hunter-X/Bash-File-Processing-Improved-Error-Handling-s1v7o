#!/bin/bash

# This script attempts to process a list of files, but it has a subtle bug.
# The problem is in how it handles potential errors during file processing.

files=("/tmp/file1.txt" "/tmp/file2.txt" "/tmp/file3.txt")

for file in "${files[@]}"; do
  # Attempt to process each file.  Notice that there is no error checking
  # in this particular example to make the bug more apparent.
  process_file "$file"
  echo "Processed: $file"
done

process_file() {
  # Simulates file processing.  Sometimes it fails.
  local file="$1"
  if [[ "$RANDOM" % 2 -eq 0 ]]; then
    echo "Processing $file... success!"
  else
    echo "Processing $file... failure!"
    # The error is not handled properly
    exit 1
  fi
}

# Note that the script doesn't check if the files exist.  This is also a potential source of errors. If the script encounters an error, the loop will stop unexpectedly.