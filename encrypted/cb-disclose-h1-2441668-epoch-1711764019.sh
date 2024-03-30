#!/bin/bash
# Keys for self and CB-Devs; GH user_ids:
#   brianddk renanmav taycaldwell wbnns
key_ids=(            \
  "835F0433A6D51860" \
  "F11F27CB27C99543" \
  "1D2438440FDE48B4" \
  "954C0D74D2146C22" \
  "AFAE33CB939EB312" \
  "302EBEAEEB74A404" \
  "3ABBE96D1430792F" )

# Encrypt cleartext to encrypted
infile="../cleartext/cb-disclose-h1-2441668-epoch-1711764019.md"
outfile="../encrypted/cb-disclose-h1-2441668-epoch-1711764019.md.asc"

# Build the GPG command to encrypt
gpgcmd="gpg --homedir ../keystore -qea"
for key in "${key_ids[@]}"; do
    gpgcmd="${gpgcmd} -r ${key} --trusted-key ${key}"
done

# Encrypt
$(${gpgcmd} --output ${outfile} -e ${infile})
