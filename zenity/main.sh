#! /bin/bash

# Add directory to the path
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
pushd $DIR

source lib.sh

cache_dir="`pwd`/.helo-cache"
cache_date_dir=${cache_dir}/${date}
mkdir -p "$cache_date_dir"

# Load all available the script
./loader.sh $cache_date_dir

# Select the script to install
tell "Now select the scripts you want install with the checkbox"
# selected_sh=$(./zenity_list.sh)
selected_sh=$DIR

IFS='|' #setting delimiter
read -a scripts_sel_splitted <<<"$selected_sh" #reading str as an array as tokens separated by IFS

script_n=${#scripts_sel_splitted[*]}
max_bar=100
script_step=$(( $max_bar / $script_n ))
current_step=0

echo "script step: $script_step"
say "You selected $script_n scripts to install! Let's do this!"

(for (( n=0; n < ${#scripts_sel_splitted[*]}; n++ ))
do

  ./install.sh "${scripts_sel_splitted[n]}" $current_step
  current_step=$(($current_step + $script_step))


done) | zenity --title "Installing" --progress --auto-kill

say "Installation completed. Don't forget to offer a couple of coffe to"
say_slow "Horus Elohim"
say "Have a nice day."

popd
