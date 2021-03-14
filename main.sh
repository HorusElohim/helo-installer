#! /bin/bash


sudo apt install -y git zenity zsh

git clone https://github.com/HorusElohim/zsh-helo-installer.git

pushd  ./zsh-helo-installer/zenity
echo -e "Execute main.sh inside zenity folder"
./main.sh
popd
