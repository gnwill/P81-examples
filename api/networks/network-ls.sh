#!/bin/bash

ACCESS_TOKEN="abcdefg1234567"

# Retrieve a list of networks from your tenant

curl -X GET \
     -H "Authorization: Bearer $ACCESS_TOKEN" \
     -H "Content-Type: application/json" \
     "https://api.perimeter81.com/api/rest/v2/networks" \
| jq .

