#!/bin/bash

# Check if the input file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_domains_and_ips>"
    exit 1
fi

# Check if the output file is provided
if [ -z "$2" ]; then
    echo "Usage: $0 <file_with_domains_and_ips> <output_file>"
    exit 1
fi

# Input and output files
input_file="$1"
output_file="$2"

# Clear the output file
> "$output_file"

# Extract IP addresses and save to the output file
grep -oP '(\d{1,3}\.){3}\d{1,3}|([0-9a-fA-F]{1,4}:){7}[0-9a-fA-F]{1,4}' "$input_file" > "$output_file"



# This script is for removing domains associated with ip's [X] >>> www.domains.com : 1.1.1.1 <<< [X] {It will only give IP}
