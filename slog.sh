#!/bin/bash

cd $(cd `dirname $0`; pwd)
git pull

touch date.log
echo "$(date +%F\ %H\:%M) is OK" >> date.log
touch data.txt
cat /dev/urandom | base64 | head -c 1000 > data.txt

git add .
git commit -am "Updated: $(date +%F\ %H\:%M)"
git push
