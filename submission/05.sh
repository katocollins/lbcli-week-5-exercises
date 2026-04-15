# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277


result=$(python3 -c "
import hashlib, struct
 
pubkey = bytes.fromhex('$pubkey')
sha = hashlib.sha256(pubkey).digest()
r = hashlib.new('ripemd160')
r.update(sha)
pubkeyhash = r.hexdigest()
 
csv_le = struct.pack('<H', 150).hex()
print(f'02{csv_le}b27576a914{pubkeyhash}88ac')
")
echo "$result"