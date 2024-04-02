#!/bin/bash
# Keys for self and CB-Devs; GH user_ids:
#   brianddk renanmav taycaldwell wbnns
cd "$(dirname "$0")"
key_ids=(            \
  "835F0433A6D51860" \
  "F11F27CB27C99543" \
  "1D2438440FDE48B4" \
  "954C0D74D2146C22" \
  "AFAE33CB939EB312" \
  "302EBEAEEB74A404" \
  "3ABBE96D1430792F" )

# Encrypt cleartext to encrypted
_file="cb-disclose-h1-2444021-epoch-1712016163"
infile="../cleartext/${_file}.md"
outfile="../encrypted/${_file}.md.asc"

# Build the GPG command to encrypt
gpgcmd="gpg --homedir ../keystore -qea"
for key in "${key_ids[@]}"; do
    gpgcmd="${gpgcmd} -r ${key} --trusted-key ${key}"
done

# Encrypt
$(${gpgcmd} --output ${outfile} -e ${infile})
