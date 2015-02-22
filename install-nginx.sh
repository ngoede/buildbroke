#!/usr/bin/env bash
owner=$1
apt-get install -y nginx
mkdir -p /data/www/site 
chown -R $owner:www-data /data/www/site
chmod -R 0755 /data/www/site

cp /vagrant/nginx-site-config /etc/nginx/sites-available/default
nginx -s reload