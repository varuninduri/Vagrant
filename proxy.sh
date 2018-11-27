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
