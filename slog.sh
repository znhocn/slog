#!/bin/bash

date_file="date_$(date +%Y).log"
data_file="data.txt"

cd $(cd `dirname $0`; pwd)
git pull

touch $date_file
echo "$(date +%F\ %H\:%M) is OK" >> $date_file
touch $data_file
cat /dev/urandom | base64 | head -c 1000 > $data_file

git add .
git commit -am "Updated: $(date +%F\ %H\:%M)"
git push
