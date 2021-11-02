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
python --version
/opt/python/cp36-cp36m/bin/python -m pip install cython
/opt/python/cp37-cp37m/bin/python -m pip install cython
/opt/python/cp38-cp38/bin/python -m pip install cython
/opt/python/cp39-cp39/bin/python -m pip install cython
