#!/bin/sh -Cefu
first=/root/txt/first-names.txt
last=/root/txt/last-names.txt

count=1000
while read firstname
do
  lastname="$(shuf -n1 "$last")"
  uid="$(echo "$firstname.$lastname" | tr '[:upper:]' '[:lower:]')"
  dsidm slapd-localhost \
    user create \
    --uid "$uid" \
    --cn "$firstname $lastname" \
    --displayName "$firstname $lastname" \
    --uidNumber "$count" --gidNumber "$count" \
    --homeDirectory "/home/$uid"
  count=$(( count + 1 ))
done < "$first"
