# Create a time-based CSV script that would lock funds for 6 months (using 30-day months)
# Time-based CSV uses 512-second units with the type flag (bit 22) set
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

result=$(python3 -c "
import hashlib, struct
 
pubkey = bytes.fromhex('$pubkey')
sha = hashlib.sha256(pubkey).digest()
r = hashlib.new('ripemd160')
r.update(sha)
pubkeyhash = r.hexdigest()
 
seconds = 6*30*24*60*60
nvalue = seconds // 512
nvalue_flag = nvalue | 0x400000
csv_le = struct.pack('<I', nvalue_flag)[:3].hex()
print(f'03{csv_le}b27576a914{pubkeyhash}88ac')
")
echo "$result"
 