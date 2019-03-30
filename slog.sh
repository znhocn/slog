#!/bin/bash
# by: ZnHoCn
# crontab:
# 0 * * * * bash /<PATH>/slog/slog.sh 2&> /dev/null

data_file="data.txt"
date_file="date_$(date +%Y).log"
github_url="git@github.com:znhocn/slog.git"

cd $(cd `dirname $0`; pwd)
git pull

touch $data_file
cat /dev/urandom | base64 | head -c 1000 > $data_file
touch $date_file
echo "$(date +%F\ %H\:%M) is OK" >> $date_file

git add .
git commit -am "Updated: $(date +%F\ %H\:%M)"
git push

echo $(git push  2>&1 | grep fatal)

if [ -z $(git push  2>&1 | grep fatal) ]; then
    echo "git push ok"
else
    echo "git push fatal"
    cd $(cd `dirname $0`; pwd)/../
    rm -rf $(cd `dirname $0`; pwd)
    git clone $github_url
fi
