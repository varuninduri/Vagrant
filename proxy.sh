!/usr/bin/env bash
# Packages
HAPROXY="haproxy"
# Haproxy
HAPROXY_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $HAPROXY | grep "install ok installed")
echo "Checking for $HAPROXY: $HAPROXY_INSTALLED"
if [ "" == "$HAPROXY_INSTALLED" ]; then
  sudo apt-get install -y $HAPROXY
  sudo service haproxy start
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
sudo rm -rf /etc/haproxy/haproxy.cfg
echo "proxy removed"
sudo cp haproxy.cfg /etc/haproxy
echo "proxy copied"
sudo service haproxy restart
echo "proxy restarted"
