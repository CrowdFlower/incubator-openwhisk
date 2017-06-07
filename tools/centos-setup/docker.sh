#!/bin/bash

set -ex

sudo yum remove -y docker docker-common container-selinux docker-selinux docker-engine

sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum-config-manager --disable docker-ce-edge
sudo yum makecache fast

# # AUFS
# sudo apt-get -y install linux-image-extra-$(uname -r)

# DOCKER
sudo yum install -y docker-ce.x86_64

# enable (security - use 127.0.0.1)
sudo -E bash -c 'echo '\''DOCKER_OPTS="-H tcp://0.0.0.0:4243 -H unix:///var/run/docker.sock --storage-driver=aufs"'\'' >> /etc/default/docker'
sudo -E bash -c 'echo -e '\''{\n  "storage-driver": "devicemapper"\n}'\'' > /etc/docker/daemon.json'
sudo gpasswd -a `whoami` docker

# Set DOCKER_HOST as an environment variable
sudo -E bash -c 'echo '\''export DOCKER_HOST="tcp://0.0.0.0:4243"'\'' >> /etc/bash.bashrc'
source /etc/bash.bashrc

sudo systemctl enable docker.service
sudo systemctl restart docker.service

# do not run this command without a vagrant reload during provisioning
# it gives an error that docker is not up (which the reload fixes).
# sudo docker version
