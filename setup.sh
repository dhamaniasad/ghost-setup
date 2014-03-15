#!/bin/bash

# Install Nodejs

add-apt-repository ppa:chris-lea/node.js
apt-get update
apt-get -y install nodejs

# Download the latest Ghost release

wget https://ghost.org/zip/ghost-latest.zip -O ghost.zip

# Ensure the system has unzip - Cross system(CentOS/Debian) compat planned.

apt-get -y install zip
apt-get -y install unzip

# Unzip Ghost

unzip ghost.zip

# Enter the Ghost directory

cd ghost

# Install Ghost

npm install --production

# Start Ghost 

npm start

# Change configuration - TO DO(modify IP, port(2368 to 80), allow external access)