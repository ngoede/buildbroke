# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_check_update = false
  config.vm.network "forwarded_port", guest: 80, host: 8080

  config.vm.provision "shell", inline: <<-SHELL
    set -e
    apt-get update
    
    #install rvm
    gpg --import /vagrant/mpapis.asc
    \\curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer
    \\curl -O https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer.asc
    if gpg --verify rvm-installer.asc; then
      bash rvm-installer stable
      source /etc/profile.d/rvm.sh
      rvm install 2.2.0
      curl -sL https://deb.nodesource.com/setup | bash -
      apt-get install -y nodejs
      gem install jekyll
    fi
    
    #install nginx
    apt-get install -y nginx
    cp /vagrant/nginx-site-config /etc/nginx/sites-available/default
  SHELL
end
