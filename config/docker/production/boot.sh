#!/bin/sh

repo="https://github.com/phusion/passenger-ruby-rails-demo.git"
branch="end_result"
dir="/home/app/example"
logfile="/var/log/example.log"

touch "$logfile"
chown -R app:app "$logfile"

mkdir -p /var/log/nginx/
chown -R www-data:adm /var/log/nginx/

su - app <<EOF
if [ -d "$dir" ]; then
 cd "$dir"
 git reset --hard
 git clean -fd .
 su app git checkout "$branch"
 git pull
 git checkout "$branch" 
 git pull
 git reset --hard "origin/$branch"
else
 git clone -b "$branch" "$repo" "$dir"
 cd "$dir"
 git checkout "$branch"
fi

bundle install
bundle exec passenger start
EOF

chown -R app:app "$dir"
