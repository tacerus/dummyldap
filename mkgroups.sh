#!/bin/sh

for x in \
  marketing engineering hr management
do
  dsidm slapd-localhost \
    group create --cn "$x"
done
