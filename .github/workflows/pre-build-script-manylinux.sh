#!/bin/bash
set -e -x

# remove old bison installation
yum remove -y bison
# install newer bison
cd /tmp
BISON=bison-3.4
curl -o bison.tar.gz http://ftp.gnu.org/gnu/bison/$BISON.tar.gz
tar -xvzf bison.tar.gz
cd $BISON
./configure --prefix=/usr/local/
make
make install
bison --version
if [ `uname -m` == "aarch64" ]; then
   for ver in {cp36-cp36m, cp37-cp37m, cp38-cp38, cp39-cp39} 
    do
      /opt/python/$ver/bin/python -m pip install cython
   done
fi
