#!/bin/bash

#clone app
cd ~
git clone -b monolith https://github.com/express42/reddit.git

#install bundles
cd reddit && bundle install

#run app
puma -d
