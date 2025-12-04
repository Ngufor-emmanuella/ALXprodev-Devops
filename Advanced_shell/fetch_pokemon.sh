
#!/bin/bash

# Objective: Automate the process of making API requests to the Pokémon API and saving the results to a file
i
#!/bin/bash

# Objective: Automate the process of making API requests to the Pokémon API and saving the results to a file

# Define API endpoint and Pokémon name
POKEMON_NAME="pikachu"
API_URL="https://pokeapi.co/api/v2/pokemon/${POKEMON_NAME}"
DATA_FILE="data.json"
ERROR_FILE="errors.txt"
API_AUTOMATION_FILE="apiAutomation-0x00"

# Check if apiAutomation-0x00 file exists and is not empty
if [[ ! -e $API_AUTOMATION_FILE ]]; then
    echo "Error: '$API_AUTOMATION_FILE' does not exist." >> $ERROR_FILE
    exit 1
fi

if [[ ! -s $API_AUTOMATION_FILE ]]; then
    echo "Error: '$API_AUTOMATION_FILE' is empty." >> $ERROR_FILE
    exit 1
fi

# Make a request to the Pokémon API
response=$(curl -s -w "%{http_code}" -o "${DATA_FILE}" "${API_URL}")

# Check for errors in the API request
if [[ $response -ne 200 ]]; then
    echo "Error: API request failed with response code $response." >> $ERROR_FILE
    exit 1
fi

# Log success message
echo "Successfully retrieved data for $POKEMON_NAME and saved to $DATA_FILE."
# Define API endpoint and Pokémon name
POKEMON_NAME="pikachu"
API_URL="https://pokeapi.co/api/v2/pokemon/${POKEMON_NAME}"
DATA_FILE="data.json"
ERROR_FILE="errors.txt"
API_AUTOMATION_FILE="apiAutomation-0x00"

# Check if apiAutomation-0x00 file exists and is not empty
if [[ ! -e $API_AUTOMATION_FILE ]]; then
    echo "Error: '$API_AUTOMATION_FILE' does not exist." >> $ERROR_FILE
    exit 1
fi

if [[ ! -s $API_AUTOMATION_FILE ]]; then
    echo "Error: '$API_AUTOMATION_FILE' is empty." >> $ERROR_FILE
    exit 1
fi

# Make a request to the Pokémon API
response=$(curl -s -w "%{http_code}" -o "${DATA_FILE}" "${API_URL}")

# Check for errors in the API request
if [[ $response -ne 200 ]]; then
    echo "Error: API request failed with response code $response." >> $ERROR_FILE
    exit 1
fi

# Log success message
echo "Successfully retrieved data for $POKEMON_NAME and saved to $DATA_FILE."
