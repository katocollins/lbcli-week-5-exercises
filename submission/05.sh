#!/usr/bin/env bash

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277
blocks=150

# Convert to little-endian hex (minimal bytes)
hex=$(printf '%x' $blocks)

# Ensure even length
if [ $(( ${#hex} % 2 )) -ne 0 ]; then
  hex="0$hex"
fi

# Convert to little endian
lehex=$(echo $hex | sed 's/\(..\)/\1 /g' | awk '{for(i=NF;i>0;i--) printf $i}')

# Get byte length (for push opcode)
bytes=$((${#lehex} / 2))
push=$(printf '%02x' $bytes)

# Hash160(pubkey)
pubKeyHash=$(echo -n $publicKey | xxd -r -p \
  | openssl dgst -sha256 -binary \
  | openssl dgst -rmd160 \
  | awk '{print $2}')

# Build script
result="${push}${lehex}b27576a914${pubKeyHash}88ac"

# Clean output
printf "%s" "$result"