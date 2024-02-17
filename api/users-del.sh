#!/bin/bash

# Create an API Token in your tenant, https://support.perimeter81.com/docs/authorize
ACCESS_TOKEN=""


# https://support.perimeter81.com/docs/api-getting-started
API_ENDPOINT="https://api.perimeter81.com/api/rest/v1/users/"

# iterates over a list of userids, and deletes each one if it exists.

while IFS= read -r USER_ID; do
    # Check if USER_ID is not empty
    if [ -n "$USER_ID" ]; then
        # Construct the curl command with an empty JSON object in the request body
        curl -X 'DELETE' -H "Authorization: Bearer $ACCESS_TOKEN" "$API_ENDPOINT$USER_ID" -H 'Content-Type: application/json' -d '{}'
        echo "User with ID $USER_ID deleted"
    fi
done < users.txt
