#!/bin/sh

# Check that exactly 2 arguments are given
if [ $# -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <writefile> <writestr>"
    exit 1
fi

writefile=$1
writestr=$2

# Extract directory path from writefile
write_dir=$(dirname "$writefile")

# Create directory path if it does not exist
mkdir -p "$write_dir"
if [ $? -ne 0 ]; then
    echo "Error: Could not create directory path '$write_dir'."
    exit 1
fi

# Write the string to the file (overwrite)
echo "$writestr" > "$writefile"
if [ $? -ne 0 ]; then
    echo "Error: Could not create file '$writefile'."
    exit 1
fi

