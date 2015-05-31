#!/usr/bin/env bash

echo Installing dependencies...
apt-get update
apt-get install -y build-essential make curl nodejs

echo Installing RVM + Ruby...
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --ruby
source /etc/profile.d/rvm.sh

echo Installing Bundle...
su vagrant
gem install bundle
cd /vagrant
bundle install

echo Serving pages...
bundle exec jekyll serve