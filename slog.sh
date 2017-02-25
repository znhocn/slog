#!/bin/bash

cd $(cd `dirname $0`; pwd)
touch date.log
echo "$(date +%F) is OK" >> date.log
touch data.txt
cat /dev/urandom | base64 | head -c 1000 > data.txt

git pull
git add .
git commit -am "Updated: $(date +%F )"
git push
