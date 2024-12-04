# Bash Script: Improper Error Handling in File Processing Loop

This repository demonstrates a common error in bash scripting: failing to properly handle exit codes within a loop. The script attempts to process a list of files but stops unexpectedly if one file cannot be processed.  The solution showcases best practices for robust error handling in shell scripts.

## Bug

The `bug.sh` script contains a loop that iterates over a list of files. A function `process_file` simulates file processing, sometimes failing and exiting with a non-zero status code.  The main loop does not check the exit status of `process_file`, leading to premature termination.

## Solution

The `bugSolution.sh` script addresses this issue by using the `$?` variable to check the exit status of the `process_file` function. If an error occurs, an informative message is printed, but the loop continues, ensuring all files are processed.

## Additional Considerations

* **Error Handling:** Implement comprehensive error handling for edge cases like file existence checks.
* **Logging:** Add logging to monitor the script's progress and report errors to a log file.
* **Exit Codes:** Use appropriate exit codes to signal different types of errors.