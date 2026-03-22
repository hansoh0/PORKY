#!/bin/bash
set -e
set -a
source .env
set +a

CDIR="/ssl"
mkdir -p "$CDIR"

response=$(jq -n \
--arg secret "$SEC_KEY" \
--arg api "$API_KEY" \
'{secretapikey: $secret, apikey: $api}' | \
curl -s --fail --noproxy "*" -X POST "$ENDPOINT" \
-H "Content-Type: application/json" \
-d @-)

jq -r '.certificatechain' <<< "$response" > "$CDIR/certificate_chain.pem"
jq -r '.privatekey' <<< "$response" > "$CDIR/private_key.pem"
jq -r '.publickey' <<< "$response" > "$CDIR/public_key.pem"

chmod 600 "$CDIR"/*
