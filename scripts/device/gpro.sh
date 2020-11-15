#! /bin/bash

mkdir -p /tmp/gpro
pushd /tmp/gpro

sudo add-apt-repository ppa:libratbag-piper/piper-libratbag-git
sudo apt-get update
sudo apt install ratbagd

git clone https://github.com/libratbag/piper.git
pushd piper

meson builddir --prefix=/usr/
ninja -C builddir
sudo ninja -C builddir install

popd
popd


