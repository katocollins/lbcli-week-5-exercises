# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277


publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

seconds=$((6*30*24*60*60))
nvalue=$(($seconds/512))
hexvalue=$(printf '%x\n' $nvalue)
relativevalue=$(printf '%x\n' $((0x$hexvalue | 0x400000)))

lehex=$(submission/integer2lehex.sh $((16#$relativevalue)) | grep "Hexcode" | awk '{print $2}')

pubKeyHash=$(echo -n $publicKey | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $2}')

echo "${lehex}b27576a914${pubKeyHash}88ac" 