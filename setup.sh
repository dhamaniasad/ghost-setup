#!/bin/bash

# Get an store IP in variable

IP=$(ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')

# Install node dependencies

apt-get -y install python-software-properties
apt-get -y install python
apt-get -y install g++
apt-get -y install make
apt-get -y install software-properties-common

# Install Nodejs

add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get -y install nodejs

# Download the latest Ghost release

wget https://ghost.org/zip/ghost-latest.zip -O ghost.zip

# Ensure the system has unzip - Cross system(CentOS/Debian) compat planned.

apt-get -y install zip
apt-get -y install unzip

# Unzip Ghost

unzip -uo ghost.zip -d ghost

# Enter the Ghost directory

cd ghost

# Install Ghost

npm install --production

# Change configuration - TO DO(modify IP, port(2368 to 80), allow external access)

sed -i 's/2368/80/g' config.js
sed -i "s/127.0.0.1/$IP/g" config.js

# Start Ghost 

npm start