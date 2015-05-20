#!/usr/bin/env bash

path="${PWD}"

mkdir ${path}/src
cd ${path}/src
sudo apt-get update
sudo apt-get -y install build-essential libtool flex bison \
                        libpopt-dev uuid-dev libglib2.0-dev autoconf \
                        git libxml2-dev
git clone git://git.lttng.org/lttng-ust.git
git clone git://git.lttng.org/lttng-modules.git
git clone git://git.lttng.org/lttng-tools.git
git clone git://git.lttng.org/userspace-rcu.git
git clone git://git.efficios.com/babeltrace.git
git clone https://github.com/nodejs/io.js

cd userspace-rcu
./bootstrap && ./configure && make -j 4 && sudo make install
sudo ldconfig

cd ../lttng-ust
./bootstrap && ./configure && make -j 4 && sudo make install
sudo ldconfig

cd ../lttng-modules
make && sudo make modules_install
sudo depmod -a

cd ../lttng-tools
./bootstrap && ./configure && make -j 4 && sudo make install
sudo ldconfig
sudo cp extras/lttng-bash_completion /etc/bash_completion.d/lttng

cd ../babeltrace
./bootstrap && ./configure && make -j 4 && sudo make install
sudo ldconfig

# install io.js from source as we need to build with-lttng support
cd ../io.js
./configure --with-lttng
make
make install


#wget https://iojs.org/dist/v1.4.2/iojs-v1.4.2-linux-x64.tar.xz
#tar xf iojs-v1.4.2-linux-x64.tar.xz
#cd iojs-v1.4.2-linux-x64
#cp bin/* /usr/bin

# tidy up
apt-get autoremove -y
