#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_ips> <output_file>"
    exit 1
fi

# Check if the output file is provided
if [ -z "$2" ]; then
    echo "Usage: $0 <file_with_ips> <output_file>"
    exit 1
fi

# Input and output files
input_file="$1"
output_file="$2"

# Clear the output file
> "$output_file"

# Extract only IPv4 addresses and save to the output file
grep -oP '(\d{1,3}\.){3}\d{1,3}' "$input_file" > "$output_file"


#if in your text file you have ipV6 address remove it using above script 
