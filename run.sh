#!/bin/sh
echo "cloning code from git repo"
cd /home/vagrant
git clone https://github.com/varuninduri/HPSE.git
sleep 30s
echo "cloned"
cd /home/vagrant/HPSE/ShortestPath
echo "compiling code with maven"
mvn clean install
cd /home/vagrant/HPSE/ShortestPath/target/
echo "starting application"
nohup java -jar ShortestPath-1.0.jar &
sleep 30s
echo "started Application"
cd /home/vagrant/HPSE/ShortestPathUI
sudo npm install
sleep 30s
echo "starting ui"
node app.js &
sleep 30s
echo "ui started"
