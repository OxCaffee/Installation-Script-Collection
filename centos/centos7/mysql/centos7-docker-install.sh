#!/bin/bash

# This is a script for docker installation, please check your system
# only centos3.0 and higher system version supports docker
# Please make sure you are in root mode
# This script will remove your previous docker installation, be cautious

# Update your system
yum -y update

# Remove previous installation
yum remove docker \
           docker-client \
           docker-client-latest \
           docker-common \
           docker-latest \
           docker-latest-logrotate \
           docker-logrotate \
           docker-engine

# Using aliyun docker installation script
# Or: curl -sSL https://get.daocloud.io/docker | sh
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

# Start docker
systemctl start docker

# Enable docker autoboot
systemctl enable docker
systemctl daemon-reload

# Config docker mirror
touch /etc/docker/daemon.json
echo "{\"registry-mirros\":[\"https://registry.docker-cn.com\"]}" > /etc/docker/daemon.json

# Restart docker
systemctl restart docker
