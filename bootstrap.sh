#!/usr/bin/env bash

path="${PWD}"

mkdir ${path}/src
cd ${path}/src
sudo apt-get update
sudo apt-get -y install build-essential libtool flex bison \
                        libpopt-dev uuid-dev libglib2.0-dev autoconf \
                        git libxml2-dev software-properties-common

sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get -y install gcc-4.9 g++-4.9 cpp-4.9

cd /usr/bin
rm gcc g++ cpp
ln -s gcc-4.9 gcc
ln -s g++-4.9 g++
ln -s cpp-4.9 cpp
cd ${path}/src

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
