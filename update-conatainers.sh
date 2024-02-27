#!/usr/bin/env 

# run as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Update all Docker containers
sudo docker container update --restart=unless-stopped $(sudo docker container ls -aq)x

