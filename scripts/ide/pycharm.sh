#! /bin/bash


User="mark"
Name="pycharm-professional"
ShortName="pycharm"
Version="202.7660.19"
UnTarVersion="2020.2.3"
Ide="${Name}-${Version}.tar.gz"
Link="http://download.jetbrains.com/python/${Ide}"

sudo install -d -o $User /tmp/${Name}
pushd /tmp/${Name}

wget --show-progress  $Link
sudo install -d -o $User /opt/ide/$Name

tar -xvf  $Ide -C  /opt/ide/$Name
sudo chown -R $User: /opt/ide/$Name

popd

echo "Installing alias in zshrc"
AliasStart="## Alias-->${ShortName}"
Alias="alias pyc='/opt/ide/${Name}/${ShortName}-${UnTarVersion}/bin/pycharm.sh > /tmp/${Name,,}/log.txt 2>&1'"
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
