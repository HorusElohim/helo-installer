#! /bin/bash

User="mark"
Name="CLion"
Version="203.5600.25"
Ide="${Name}-${Version}.tar.gz"
Link="https://download.jetbrains.com/cpp/${Ide}"

sudo install -d -o $User/tmp/${Name}
pushd /tmp/${Name}

wget --show-progress  $Link
sudo install -d -o $User /opt/ide/$Name

tar -xvf  $Ide -C  /opt/ide/$Name
sudo chown -R $User: /opt/ide/$Name

popd

echo "Installing alias in zshrc"

zsh_cfg="/home/$User/.zshrc"
AliasStart="## Alias-->${Name}"
Alias="alias clion='/opt/ide/${Name}/${Name,,}-${Version}/bin/clion.sh > /tmp/${Name,,}/log.txt 2>&1'"
zsh_cfg="/home/$User/.zshrc"
# Check if already exist - Update
if grep -xqF "$AliasStart" "$zsh_cfg"; then
  # Already Exist - Update
  echo "${Name} already in your $zsh_cfg."
else # Else - Add to zshrc
  echo "No ${Name} alias found in your $zsh_cfg. Adding it!"
  bash -c "cat >> $zsh_cfg << EOF

$AliasStart
$Alias
EOF"
fi



exit 0
