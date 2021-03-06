#!/bin/bash

# Get an store IP in variable

IP=$(ifconfig | grep 'inet addr:'| grep -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}')

# Install screen

apt-get -y install screen

# Install node dependencies

apt-get update
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

# Change configuration

sed -i 's/2368/80/g' /root/ghost/config.example.js
sed -i "s/127.0.0.1/$IP/g" /root/ghost/config.example.js

# Start Ghost 

screen -d -m npm start

# Announce

echo "\nGhost has now been installed and setup. It has been started in a detached screen session. To list the running screens, use screen -ls command.\n"
echo "To finish installation, go to http://$IP/ghost"