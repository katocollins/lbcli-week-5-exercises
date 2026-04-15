#!/usr/bin/env bash

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

# Correct minimal encoding for 150
lehex="9600"
push="02"

# Hash160(pubkey)
pubKeyHash=$(echo -n $publicKey | xxd -r -p \
  | openssl dgst -sha256 -binary \
  | openssl dgst -rmd160 \
  | awk '{print $2}')

# Build script
result="${push}${lehex}b27576a914${pubKeyHash}88ac"

# Output clean (NO newline)
printf "%s" "$result"