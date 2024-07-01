#!/bin/bash

# Check if the input file with domains is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <file_with_domains> <output_file>"
    exit 1
fi

# Check if the output file is provided
if [ -z "$2" ]; then
    echo "Usage: $0 <file_with_domains> <output_file>"
    exit 1
fi

# Input and output files
input_file="$1"
output_file="$2"

# Clear the output file
> "$output_file"

# Read the input file line by line
while IFS= read -r domain; do
    # Find the IP address using nslookup
    echo "Finding IP for $domain..."
    nslookup_output=$(nslookup "$domain")

    # Check if the nslookup command was successful
    if [ $? -eq 0 ]; then
        # Extract the IP address from the nslookup output
        ip_address=$(echo "$nslookup_output" | grep -A 1 "Name:" | grep "Address:" | tail -n 1 | awk '{print $2}')

        if [ -n "$ip_address" ]; then
            # Save the IP address to the output file
            echo "$domain: $ip_address" >> "$output_file"
            echo "$domain is reachable. IP: $ip_address"
        else
            echo "$domain is not reachable."
        fi
    else
        echo "$domain is not reachable."
    fi
    echo ""
done < "$input_file"


# Script based on finding of ip's if you have number of domains in a file 
#@satendrapatel980
