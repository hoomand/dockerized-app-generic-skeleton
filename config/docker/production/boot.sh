#!/bin/sh

repo=”git@github.com:hopsoft/example.git”
dir=”/home/app/example”
logfile=”/var/log/example.log”

touch “$logfile”
chown -R app:app “$logfile”

mkdir -p /var/log/nginx/
chown -R www-data:adm /var/log/nginx/

su - app <<EOF
if [ -d “$dir” ]; then
 cd “$dir”
 git reset — hard
 git clean -fd .
 su app git checkout master
 git pull
 git checkout master
 git pull
 git reset — hard “origin/master”
else
 git clone “$repo” “$dir”
 cd “$dir”
 git checkout master
fi

/usr/local/bin/bundle --deployment
/usr/local/bin/bundle clean --force
RAILS_ENV=production /usr/local/bin/bundle exec rake assets:clobber
RAILS_ENV=production /usr/local/bin/bundle exec rake assets:precompile
EOF

chown -R app:app "$dir"
