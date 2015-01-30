#!/usr/bin/env bash
apt-get install -y nginx
mkdir -p /data/www/site
chown -R vagrant:www-data /data/www/site
chmod -R 0755 /data/www/site

cp /vagrant/nginx-site-config /etc/nginx/sites-available/default
nginx -s reload