#!/bin/bash

sudo apt update
sudo apt install -y ruby-full ruby-bundler build-essential
sudo ruby -v

#add key and repo
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
#install mongodb
sudo apt-get update
sudo apt-get install -y mongodb-org

#run mongodb
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod

#clone app
cd ~
git clone -b monolith https://github.com/express42/reddit.git

#install bundles
cd reddit && bundle install

#run app
puma -d
