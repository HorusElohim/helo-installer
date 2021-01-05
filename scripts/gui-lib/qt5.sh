#! /bin/bash

mkdir -p /tmp/qt5
pushd /tmp/qt5/

wget http://download.qt.io/official_releases/qt/5.15/5.15.1/single/qt-everywhere-src-5.15.1.tar.xz
tar xvf qt-everywhere-src-5.15.1.tar.xz
pushd qt-everywhere-src-5.15.1/
./configure
make -j24
sudo make install 




