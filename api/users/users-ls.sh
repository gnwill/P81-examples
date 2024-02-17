#!/bin/bash

ACCESS_TOKEN=""

#https://support.perimeter81.com/docs/get-list-users

PAGE=1
LIMIT=25

API_URL="https://api.perimeter81.com/api/rest/v1/users"
REQUEST_URL="${API_URL}?page=${PAGE}&limit=${LIMIT}"

curl -X GET -H "Authorization: Bearer ${ACCESS_TOKEN}" -H "Content-Type: application/json" "${REQUEST_URL}" | jq .
