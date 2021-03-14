#! /bin/bash

source lib.sh

script_path=$1
current_step=$2

script_name=$(basename $script_path)

echo "$current_step"
echo "# Installing $script_name"
say "Installing $script_name"

sudo "$script_path" | zenity --text-info `_helo_console_result_size $script_name` &

