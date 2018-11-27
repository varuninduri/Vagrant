#!/usr/bin/env bash
# Packages
BUILD_ESSENTIAL="build-essential"
MONGO="mongodb-org"
# MongoDB
MONGO_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $MONGO | grep "install ok installed")
echo "Checking for $MONGO: $MONGO_INSTALLED"
if [ "" == "$MONGO_INSTALLED" ]; then
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
  echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list
  apt-get update
  apt-get install -y mongodb-org
fi
GIT="git"
# Prerequisites
GIT_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $GIT | grep "install ok installed")
echo "Checking for $GIT: $GIT_INSTALLED"
if [ "" == "$GIT_INSTALLED" ]; then
  apt-get update
  apt-get install -y $GIT
fi
#!/bin/sh
echo "cloning code from git repo"
cd /home/vagrant
git clone https://github.com/varuninduri/Vagrant.git
sleep 30s
echo "cloned"
cd /home/vagrant/Vagrant
sudo rm -rf /etc/mongod.conf
echo "conf removed"
sudo cp mongod.conf /etc/
echo "conf copied"
sudo service mongod restart
echo "mongod restarted"
