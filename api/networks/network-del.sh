#!/bin/bash

SERVER_URL="https://api.perimeter81.com/api/rest"
BEARER_TOKEN="abcdefg1234567"
NETWORK_ID="blah"

curl -X 'DELETE' \
  "$SERVER_URL/v2/networks/$NETWORK_ID" \
  -H 'accept: application/json' \
  -H "Authorization: Bearer $BEARER_TOKEN"

