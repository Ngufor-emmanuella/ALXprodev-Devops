#!/bin/bash

# API URL for Pikachu
URL="https://pokeapi.co/api/v2/pokemon/pikachu"

# File names for saving data
DATA_FILE="data.json"
ERROR_FILE="errors.txt"

# Make the API request
response=$(curl -s -w "%{http_code}" -o "$DATA_FILE" "$URL")

# Check if the request was successful
if [[ "$response" -ne 200 ]]; then
    echo "Error: Failed to retrieve data (HTTP status code: $response)" >> "$ERROR_FILE"
else
    echo "Data for Pikachu successfully saved to $DATA_FILE"
fi