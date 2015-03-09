#!/usr/bin/env bash

path="${PWD}"

apt-get install -y git curl wget build-essential gcc

# install node
curl -sL https://deb.nodesource.com/setup | sudo bash -
apt-get update
apt-get upgrade
apt-get install -y nodejs

# install lttng
#apt-add-repository -y ppa:lttng/ppa
#apt-get update
#apt-get install -y lttng-tools lttng-modules-dkms liblttng-ust-dev

# Download dependencies for building lttng from scratch...
apt-get install -y python3-dev uuid-dev libc6-dev libglib2.0-dev bison Flex
apt-get install -y libtool autoconf libxml2-dev libpopt-dev python3-sphinx
apt-get install -y swig

# Create a folder to put all compiled programs in.
mkdir ${path}/Dev/

cd ${path}/Dev/
git clone git://git.urcu.so/userspace-rcu.git
cd userspace-rcu
checkout stable-0.8
./bootstrap
./configure
make
make install
ldconfig

export PYTHON="python3"
export PYTHON_CONFIG="/usr/bin/python3-config"

cd ${path}/Dev/
git clone git://git.efficios.com/babeltrace.git
cd babeltrace
checkout stable-1.2
./bootstrap 
./configure --enable-python-bindings
make
make install
ldconfig

cd ${path}/Dev/
git clone git://git.lttng.org/lttng-ust.git
cd lttng-ust
checkout stable-2.6
./bootstrap
./configure
make
make install
ldconfig

cd ${path}/Dev/
git clone git://git.lttng.org/lttng-tools.git
cd lttng-tools
checkout stable-2.6
./bootstrap 
./configure --enable-python-bindings
make
make install
ldconfig


cd ${path}/Dev/
git clone git://git.lttng.org/lttng-modules.git
cd lttng-modules
checkout stable-2.6
make
make modules_install
depmod -a

# Add a tracing group to access kernel stuff in lttng without needing sudo
groupadd -r tracing ###NOT NEEDED
usermod -aG tracing vagrant


# install io.js from source as we need to build with-lttng support
cd ${path}/Dev/
git clone https://github.com/iojs/io.js.git
cd io.js
git checkout v1.4.2
./configure --with-lttng
make
make install


#wget https://iojs.org/dist/v1.4.2/iojs-v1.4.2-linux-x64.tar.xz
#tar xf iojs-v1.4.2-linux-x64.tar.xz
#cd iojs-v1.4.2-linux-x64
#cp bin/* /usr/bin

# tidy up
apt-get autoremove -y
