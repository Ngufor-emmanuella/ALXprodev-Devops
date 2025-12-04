#!/bin/bash

# List of Pokémon to retrieve data for
POKEMON_LIST=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

# Base URL for the Pokémon API
BASE_URL="https://pokeapi.co/api/v2/pokemon"

# Directory for saving JSON files
OUTPUT_DIR="pokemon_data"

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through each Pokémon in the list
for POKEMON in "${POKEMON_LIST[@]}"; do
    # Create the URL for the API request
    URL="$BASE_URL/$POKEMON"
    output_file="$OUTPUT_DIR/$POKEMON.json"

    # Initialize retries
    retries=3
    success=false

    # Retry mechanism
    for ((i=1; i<=retries; i++)); do
        echo "Attempting to retrieve data for $POKEMON (Attempt $i of $retries)..."
        
        # Retrieve the data and save it to a JSON file
        curl -s "$URL" -o "$output_file"

        # Check if the curl command was successful
        if [[ $? -eq 0 && -s "$output_file" ]]; then
            echo "Data for $POKEMON retrieved successfully and saved to $output_file."
            success=true
            break  # Exit the retry loop on success
        else
            echo "Failed to retrieve data for $POKEMON. Retrying..."
            sleep 1  # Delay before retrying
        fi
    done

    # If all attempts fail, log the error
    if [[ "$success" == false ]]; then
        echo "Error: Unable to retrieve data for $POKEMON after $retries attempts." >> errors.txt
    fi

    # Add a delay to handle potential rate limiting
    sleep 1
done
