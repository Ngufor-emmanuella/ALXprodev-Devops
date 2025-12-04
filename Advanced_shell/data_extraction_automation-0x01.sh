#!/bin/bash
#!/bin/bash



#!/bin/bash

# Objective: Extract Pokémon data from data.json and check for necessary conditions.

# Define the JSON file
JSON_FILE="data.json"
SCRIPT_FILE="data_extraction_automation-0x01.sh"
ERROR_FILE="errors.txt"

# Check if the script file exists and is not empty
if [[ ! -e $SCRIPT_FILE ]]; then
    echo "Error: '$SCRIPT_FILE' does not exist." >> $ERROR_FILE
    exit 1
fi

if [[ ! -s $SCRIPT_FILE ]]; then
    echo "Error: '$SCRIPT_FILE' is empty." >> $ERROR_FILE
    exit 1
fi

# Check if data.json file exists and is not empty
if [[ ! -f $JSON_FILE ]]; then
    echo "Error: '$JSON_FILE' file not found." >> $ERROR_FILE
    exit 1
fi

if [[ ! -s $JSON_FILE ]]; then
    echo "Error: '$JSON_FILE' is empty." >> $ERROR_FILE
    exit 1
fi

# Use jq to extract name, height, weight, and type
name=$(jq -r '.name' "$JSON_FILE")
height=$(jq -r '.height' "$JSON_FILE")
weight=$(jq -r '.weight' "$JSON_FILE")
type=$(jq -r '.types[0].type.name' "$JSON_FILE")

# Check if extracted data is not empty
if [[ -z "$name" || -z "$height" || -z "$weight" || -z "$type" ]]; then
    echo "Error: One or more values are missing in the extracted data." >> $ERROR_FILE
    exit 1
fi

# Format the output
formatted_height=$(echo "$height" | awk '{print $1/10 "m"}')  # Convert to meters
formatted_weight=$(echo "$weight" | awk '{print $1 "kg"}')  # Append kg

# Output the formatted message
echo "${name^} is of type $type, weighs $formatted_weight, and is $formatted_height tall."
