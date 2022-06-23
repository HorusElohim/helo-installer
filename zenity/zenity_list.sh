#!/bin/bash

# License to referee directly to the person relative at this Account HorusElohim@gmail.com
#    ALL Copyrights Reserved To HorusElohim@gmail.com TM2021


source lib.sh

  Title="Helo Installer"
  C1="Install"
  C2="Path"
  C3="Package"
  C4="Module"
  C5="Script"
  C6="Description"

echo -e "$(zenity `_helo_main_menu_window_size` --list --title="$Title" \
--column="$C1" --column="$C2" --column="$C3" --column="$C4" --column="$C5" --column="$C6" \
Found /repo/helo-installer/scripts/basics/net-tools.sh helo-installer basics net-tools.sh " " \
Found /repo/helo-installer/scripts/basics/tree.sh helo-installer basics tree.sh " " \
Found /repo/helo-installer/scripts/basics/terminator.sh helo-installer basics terminator.sh " " \
Found /repo/helo-installer/scripts/prefect/prefect.sh helo-installer prefect prefect.sh " " \
Found /repo/helo-installer/scripts/python/python3.8.sh helo-installer python python3.8.sh " " \
Found /repo/helo-installer/scripts/browser/brave.sh helo-installer browser brave.sh " " \
Found /repo/helo-installer/scripts/ros/noetic.sh helo-installer ros noetic.sh " " \
Found /repo/helo-installer/scripts/virtual-desktop/xrdp.sh helo-installer virtual-desktop xrdp.sh " " \
Found /repo/helo-installer/scripts/deep-lib/pytorch-gpu.sh helo-installer deep-lib pytorch-gpu.sh " " \
Found /repo/helo-installer/scripts/gui-lib/qt5.sh helo-installer gui-lib qt5.sh " " \
Found /repo/helo-installer/scripts/builder/colcon.sh helo-installer builder colcon.sh " " \
Found /repo/helo-installer/scripts/builder/meson.sh helo-installer builder meson.sh " " \
Found /repo/helo-installer/scripts/docker/docker-compose.sh helo-installer docker docker-compose.sh " " \
Found /repo/helo-installer/scripts/docker/docker.sh helo-installer docker docker.sh " " \
Found /repo/helo-installer/scripts/shell/oh_zsh.sh helo-installer shell oh_zsh.sh " " \
Found /repo/helo-installer/scripts/shell/zsh.sh helo-installer shell zsh.sh " " \
Found /repo/helo-installer/scripts/pc-monitors/bmon.sh helo-installer pc-monitors bmon.sh " " \
Found /repo/helo-installer/scripts/pc-monitors/glances.sh helo-installer pc-monitors glances.sh " " \
Found /repo/helo-installer/scripts/pc-monitors/htop.sh helo-installer pc-monitors htop.sh " " \
Found /repo/helo-installer/scripts/ide/clion.sh helo-installer ide clion.sh " " \
Found /repo/helo-installer/scripts/ide/pycharm.sh helo-installer ide pycharm.sh " " \
Found /repo/helo-installer/scripts/ide/atom.sh helo-installer ide atom.sh " " \
Found /repo/helo-installer/scripts/ide/ide_manager.sh helo-installer ide ide_manager.sh " " \
Found /repo/helo-installer/scripts/python-pkg/pytorch-gpu.sh helo-installer python-pkg pytorch-gpu.sh " " \
Found /repo/helo-installer/scripts/device/nvidia.sh helo-installer device nvidia.sh " " \
Found /repo/helo-installer/scripts/device/gpro.sh helo-installer device gpro.sh " " \
Found /repo/helo-installer/scripts/screenshot/peek.sh helo-installer screenshot peek.sh " " \
Found /repo/helo-installer/scripts/linux_wm/linux_wm_manager.sh helo-installer linux_wm linux_wm_manager.sh " " \
Found /repo/helo-installer/scripts/linux_wm/kde.sh helo-installer linux_wm kde.sh " " \
Found /repo/helo-installer/scripts/linux_wm/gnome.sh helo-installer linux_wm gnome.sh " " \
Found /repo/helo-installer/scripts/linux_wm/xfce.sh helo-installer linux_wm xfce.sh " " \
--checklist)"