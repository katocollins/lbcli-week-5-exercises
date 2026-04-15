# Create a CLTV script with a timestamp of 1495584032 and public key below:
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

timestamp=1495584032

result=$(python3 -c "
import hashlib, struct
 
pubkey = bytes.fromhex('$pubkey')
sha = hashlib.sha256(pubkey).digest()
r = hashlib.new('ripemd160')
r.update(sha)
pubkeyhash = r.hexdigest()
 
ts_le = struct.pack('<I', $timestamp).hex()
print(f'04{ts_le}b17576a914{pubkeyhash}88ac')
")
echo "$result"