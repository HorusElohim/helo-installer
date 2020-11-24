#! /bin/bash

# Install ROS Noetic WS
User="mark"
WS="/opt/ros-noetic-ws"

# Install Pre-requisite
sudo apt-get install python3-rosdep2 python3-rosinstall-generator python3-vcstools build-essential

# Initializinf rosdep
sudo rosdep init
sudo rosdep fix-permissions
rosdep update

# Create Ros Noetic Installation WS
sudo install -d -o $User $WS
pushd $WS

rosinstall_generator desktop --rosdistro noetic --deps --tar > noetic-desktop.rosinstall
sudo install -d -o $User ./src
vcs import --input noetic-desktop.rosinstall ./src

# Resolving Dependencies
rosdep install --from-paths ./src --ignore-packages-from-source --rosdistro noetic -y


# Building the catkin Workspace
./src/catkin/bin/catkin_make_isolated --install -DCMAKE_BUILD_TYPE=Release

# Add to zsh
zsh_cfg="/home/$User/.zshrc"
Start="## Source-->Ros-Noetic"
ROSsource="source /opt/ros-noetic-ws/install_isolated/setup.zsh"
zsh_cfg="/home/$User/.zshrc"
# Check if already exist - Update
if grep -xqF "$Start" "$zsh_cfg"; then
  # Already Exist - Update
  echo "ROS source already in your $zsh_cfg."
else # Else - Add to zshrc
  echo "No ROS source alias found in your $zsh_cfg. Adding it!"
  bash -c "cat >> $zsh_cfg << EOF

$Start
$ROSsource
EOF"
fi
