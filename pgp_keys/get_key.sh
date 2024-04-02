#!/bin/bash
#
# Grab a key from github and import it
#
user=$1
index=$2

if [ -n "${index}" ]; then
  outfile="${user}.${index}.asc"
  idxarg=".[${index}]"
else
  outfile="${user}.asc"
  idxarg=".[]"
fi
# todo, gather key-id and add it to the filename
curl -s "https://api.github.com/users/${user}/gpg_keys" | jq "${idxarg} | .raw_key" | python -c "import sys; print(eval(sys.stdin.read()))" > "${outfile}"
gpg --homedir ../keystore --import "${outfile}"
