#! /bin/bash


if [[ ! -d ../helo-installer ]]
then
    echo "Cloning repository"
    git clone https://github.com/HorusElohim/helo-installer.git    
    cd helo-installer/zenity
else
    cd zenity
fi

echo -e "Execute main.sh inside zenity folder"
./main.sh
cd ../
