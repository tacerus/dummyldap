#!/bin/sh

users="$(dsidm slapd-localhost user list | shuf -n 336)"
groups="$(dsidm slapd-localhost group list)"

echo $users
echo $groups

for user in $users
do
  if ! echo "$user" | grep -q '\.'
  then
    continue
  fi
  group="$(echo $groups | tr ' ' '\n' | shuf -n1)"
  dsidm slapd-localhost group add_member \
    "$group" \
    uid="$user",ou=people,dc=example,dc=com
done
