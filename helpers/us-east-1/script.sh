#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
apt-get update
apt-get -y install nginx

# copy files
mv /tmp/index.nginx-debian.html /var/www/html/
mv /tmp/cidao.jpg /var/www/html/

# make sure nginx is started
service nginx start
