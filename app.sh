#!/usr/bin/env bash
# Packages
NODE="nodejs"
BUILD_ESSENTIAL="build-essential"
# Node.js
NODE_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $NODE | grep "install ok installed")
echo "Checking for $NODE: $NODE_INSTALLED"
if [ "" == "$NODE_INSTALLED" ]; then
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  apt-get install -y build-essential nodejs
fi
GIT="git"
# Prerequisites
GIT_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $GIT | grep "install ok installed")
echo "Checking for $GIT: $GIT_INSTALLED"
if [ "" == "$GIT_INSTALLED" ]; then
  apt-get update
  apt-get install -y $GIT
fi
JAVA="openjdk-8-jdk"
JAVA_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $JAVA | grep "install ok installed")
echo "Checking for $JAVA: $JAVA_INSTALLED"
if [ "" == "$JAVA_INSTALLED" ]; then
  add-apt-repository ppa:openjdk-r/ppa -y
  apt-get update
  echo "\n----- Installing Java 8 ------\n"
  apt-get -y install $JAVA
  update-alternatives --config java
  echo "java installed"
fi
MAVEN="maven"
MAVEN_INSTALLED=$(dpkg-query -W --showformat='${Status}\n' $MAVEN | grep "install ok installed")
echo "Checking for $MAVEN: $MAVEN_INSTALLED"
if [ "" == "$MAVEN_INSTALLED" ]; then
  sudo apt-get install -y $MAVEN
  echo "maven installed"
  echo "maven installed1"
  echo "maven installed2"
fi
