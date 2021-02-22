# !/bin/bash

# ###########################################
# MySQL Single Point Installtion Shell Script
# ###########################################
# Warning: Before your installtion, make sure you're in root mode and this script will
#          remove your previous mysql installation, be cautious!!!!

# remove previous installation and clean system
apt-get autoremove --purge mysql-server
apt-get remove mysql-server
apt-get autoremove mysql-server
apt-get remove mysql-common

# install deb package for mysql, here we choose mysql 8.0 version
dpkg -i mysql-apt-config_0.8.10-1_all.deb

# update
apt-get update

# install
apt-get install mysql-server
