#! /bin/bash

sudo apt install -y git zenity zsh

git clone https://github.com/HorusElohim/zsh-helo-installer.git

pushd zsh-helo-installer
  ./main.sh
popd
