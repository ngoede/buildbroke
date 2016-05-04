#!/usr/bin/env bash
set -e
apt-get update

source /vagrant/install-nginx.sh vagrant
cp /vagrant/nginx-site-config /etc/nginx/sites-available/default
apt-get install nodejs
nginx -s reload
