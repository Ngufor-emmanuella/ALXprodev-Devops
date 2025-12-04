#!/bin/bash

# Objective: Extract Pokémon data from data.json

# Check if the data.json file exists
if [[ ! -f "data.json" ]]; then
    echo "Error: data.json file not found."
    exit 1
fi

# Use jq to extract name, height, weight, and type
name=$(jq -r '.name' data.json)
height=$(jq -r '.height' data.json)
weight=$(jq -r '.weight' data.json)
type=$(jq -r '.types[0].type.name' data.json)

# Format the output and use sed to format units
echo "${name^} is of type $(echo $type | sed 's/^/Electric/')$, weighs $(echo $weight | awk '{print $1 "kg"}'), and is $(echo $height | awk '{print $1/10 "m"}') tall."
