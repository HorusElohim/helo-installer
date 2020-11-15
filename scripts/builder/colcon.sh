#! /bin/bash

# sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros-latest.list'
# sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
#
# sudo apt update
# sudo apt install python3-colcon-common-extensions
User="mark"
Start="## Source-->Colcon-Autocompletion"
Hook="source /usr/share/colcon_argcomplete/hook/colcon-argcomplete.zsh"

# Add  Hook Autocompletion in the zshrc
zsh_cfg="/home/$User/.zshrc"

if grep -q "$Start" "$zsh_cfg"; then
  # Already Exist - Update
  echo "Colcon cmd already in your $zsh_cfg."
else # Else - Add to zshrc
  echo "No Colcon cmd found in $zsh_cfg. Adding it!"
  bash -c "cat >> $zsh_cfg << EOF

$Start
$Hook
EOF"
fi
