#!/usr/bin/env bash
gpg --import /vagrant/mpapis.asc
curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer
curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer.asc
if gpg --verify rvm-installer.asc; then
  bash rvm-installer stable
  source /etc/profile.d/rvm.sh
  rvm install 2.2.0
  curl -sL https://deb.nodesource.com/setup | bash -
  apt-get install -y nodejs
  gem install jekyll
fi
