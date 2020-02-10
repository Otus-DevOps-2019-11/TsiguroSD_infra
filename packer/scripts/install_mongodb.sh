#!/bin/bash
set -e

#add key and repo
#wget -qO - https://www.mongodb.org/static/pgp/server-3.2.asc | sudo apt-key add -
#echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list

#install mongodb
apt-get update
apt-get install -y mongodb-org

#run mongodb
systemctl start mongod
systemctl enable mongod
