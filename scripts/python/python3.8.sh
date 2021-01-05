#! /bin/bash

sudo apt -y update
sudo apt install -y build-essential libqt5x11extras5 liblzma-dev zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

wdir=/tmp/python3.8-source
mkdir -p $wdir
pushd $wdir

wget https://www.python.org/ftp/python/3.8.6/Python-3.8.6.tgz
tar -xf Python-3.8.6.tgz
pushd Python-3.8.6

./configure --enable-optimizations
make -j 24
sudo make altinstall
python3.8 --version


User="mark"
echo "Installing alias in zshrc"
ShortName="pip to python3.8"
AliasStart="## Alias-->${ShortName}"
Alias="alias pip='python3.8 -m pip '"
zsh_cfg="/home/$User/.zshrc"
# Check if already exist - Update
if grep -xqF "$AliasStart" "$zsh_cfg"; then
  # Already Exist - Update
  echo "${ShortName} already in your $zsh_cfg."
else # Else - Add to zshrc
  echo "No ${ShortName} alias found in your $zsh_cfg. Adding it!"
  bash -c "cat >> $zsh_cfg << EOF

$AliasStart
$Alias
EOF"
fi


exit 0
