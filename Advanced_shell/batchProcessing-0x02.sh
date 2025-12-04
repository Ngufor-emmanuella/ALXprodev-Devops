#!/bin/bash

# List of Pokémon to retrieve data for
POKEMON_LIST=("bulbasaur" "ivysaur" "venusaur" "charmander" "charmeleon")

# Base URL for the Pokémon API
BASE_URL="https://pokeapi.co/api/v2/pokemon"

# Loop through each Pokémon in the list
for POKEMON in "${POKEMON_LIST[@]}"; do
    # Create the URL for the API request
    URL="$BASE_URL/$POKEMON"

    # Retrieve the data and save it to a JSON file
    curl -s "$URL" -o "${POKEMON}.json"

    # Check if the curl command was successful
    if [[ $? -eq 0 ]]; then
        echo "Data for $POKEMON retrieved successfully and saved to ${POKEMON}.json."
    else
        echo "Failed to retrieve data for $POKEMON."
    fi

    # Add a delay to handle rate limiting (e.g., 1 second)
    sleep 1
done
