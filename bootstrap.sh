#!/usr/bin/env bash

path="${PWD}"

mkdir ${path}/src
cd ${path}/src
sudo apt-get update
sudo apt-get -y install build-essential libtool flex bison \
                        libpopt-dev uuid-dev libglib2.0-dev autoconf \
                        git libxml2-dev
                        
sudo apt-add-repository ppa:lttng/ppa
sudo apt-get update
sudo apt-get -y install lttng-tools
sudo apt-get -y install lttng-modules-dkms
sudo apt-get -y install liblttng-ust-dev

git clone https://github.com/nodejs/node

# install node.js from source as we need to build with-lttng support
cd ./node
git checkout v6.x
./configure --with-lttng
make -j 4
make install

# tidy up
apt-get autoremove -y
