# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277


publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

lehex=$(submission/integer2lehex.sh 150 | grep "Hexcode" | awk '{print $2}')

pubKeyHash=$(echo -n $publicKey | xxd -r -p | openssl dgst -sha256 -binary | openssl dgst -rmd160 | awk '{print $2}')

echo "${lehex}b27576a914${pubKeyHash}88ac"