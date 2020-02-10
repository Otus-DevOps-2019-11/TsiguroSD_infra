#!/bin/bash

#clone app
cd ~
git clone -b monolith https://github.com/express42/reddit.git

#install bundles
cd reddit && bundle install

#run app with systemd
cp /home/appuser/puma.service /etc/systemd/system/puma.service

systemctl daemon-reload
systemctl enable puma
