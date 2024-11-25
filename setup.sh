#!/bin/sh -Cefux
# place
#   https://raw.githubusercontent.com/dominictarr/random-name/refs/heads/master/first-names.txt
#   https://gist.githubusercontent.com/craigmartin97/e98a9e2a267c379e47be1191d9431de2/raw/c09c7356e85e39e41faa92a665b7ef0b3b840b6a/last-names.txt
# in /root/txt

zypper -n in 389-ds
dscreate from-file dsconfig.ini
cp dsrc ~/.dsrc
./mkusers.sh
./mkgroups.sh
./fillgroups.sh
echo ok
