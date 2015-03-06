#!/usr/bin/env bash

apt-get install -y git curl wget build-essential gcc

# install node
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get update
apt-get install -y nodejs

# install lttng
apt-add-repository -y ppa:lttng/ppa
apt-get update
apt-get install -y lttng-tools lttng-modules-dkms liblttng-ust-dev

# Download dependencies for building lttng from scratch...
apt-get install -y python3-dev uuid-dev libc6-dev libglib2.0-dev bison Flex
apt-get install -y libtool autoconf libxml2-dev libpopt-dev

# install io.js from source as we need to build with-lttng support
git clone https://github.com/iojs/io.js.git
cd io.js
git checkout v1.4.2
./configure --with-lttng
make
make install

groupadd -r tracing
usermod -aG tracing vagrant

#wget https://iojs.org/dist/v1.4.2/iojs-v1.4.2-linux-x64.tar.xz
#tar xf iojs-v1.4.2-linux-x64.tar.xz
#cd iojs-v1.4.2-linux-x64
#cp bin/* /usr/bin

# tidy up
apt-get autoremove -y
