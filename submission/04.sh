#!/usr/bin/env bash

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
timestamp=1495584032

# Convert timestamp to 4-byte little endian hex
lehex=$(printf '%08x' $timestamp | sed 's/\(..\)/\1 /g' | awk '{for(i=NF;i>0;i--) printf $i}')

# Hash160(pubkey)
pubKeyHash=$(echo -n $publicKey | xxd -r -p \
  | openssl dgst -sha256 -binary \
  | openssl dgst -rmd160 \
  | awk '{print $2}')

# Construct script
result="04${lehex}b17576a914${pubKeyHash}88ac"

# Output clean (NO newline issues)
printf "%s" "$result"