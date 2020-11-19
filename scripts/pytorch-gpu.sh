#! /bin/zsh

pip install torch==1.7.0+cu110 torchvision==0.8.1+cu110 torchaudio===0.7.0 -f https://download.pytorch.org/whl/torch_stable.html


User="mark"
echo "Add path"
ShortName="Path to Local Python Packages"
AliasStart="## Alias-->${ShortName}"
Alias="export PATH=$PATH:/home/mark/.local/bin"
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
