#!/bin/bash

SERVER_URL="https://api.perimeter81.com/api/rest"
BEARER_TOKEN="abcdefg1234567"

curl -X 'POST' \
  "$SERVER_URL/v2/networks" \
  -H "accept: application/json" \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer $BEARER_TOKEN" \
  -d '{
  "network": {
    "subnet": "10.255.0.0/16",
    "name": "blah",
    "tags": [
      "string"
    ]
  },
  "regions": [
    {
      "regionId": "CU2Nx6dNX3",
      "idle": false
    }
  ]
}'

