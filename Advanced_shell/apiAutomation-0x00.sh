#!/bin/bash

# Make sure the script itself is executable
chmod +x "$0"

# Input JSON file
DATA_FILE="data.json"

# Check if the JSON file exists and is not empty
if [ ! -f "$DATA_FILE" ]; then
    echo "Error: $DATA_FILE does not exist."
    exit 1
elif [ ! -s "$DATA_FILE" ]; then
    echo "Error: $DATA_FILE is empty."
    exit 1
fi

# Check for required commands: jq, awk, sed
for cmd in jq awk sed; do
    if ! command -v $cmd &> /dev/null; then
        echo "Error: $cmd is not installed."
        exit 1
    fi
done

# Extract data using jq
name=$(jq -r '.name' "$DATA_FILE")
height=$(jq -r '.height' "$DATA_FILE")
weight=$(jq -r '.weight' "$DATA_FILE")
type=$(jq -r '.types[0].type.name' "$DATA_FILE")

# Format height and weight
height_m=$(echo "scale=1; $height / 10" | bc)
weight_kg=$(echo "$weight / 10" | awk '{printf "%.0f", $0}')

# Print the formatted output
echo "$name is of type $type, weighs ${weight_kg}kg, and is ${height_m}m tall."