#! /bin/bash

source lib.sh

say "Lord Helo-Installer has started!"

# Dir
cache_dir=$1

# File
log_access_file="${cache_dir}/last_access-${clock}.txt"
raw_data_file_path="${cache_dir}/helo-${clock}.raw"
data_file_path="${cache_dir}/helo-${clock}.data"
info_load_path="${cache_dir}/helo-${clock}.info"

# Log Last Access
echo  "$(awk -v today="`date`" 'BEGIN {print "LastAccess: " today}')" >> $log_access_file


# Load Raw Data and store
tell "Select the script folder inside the zsh-helo-installer pkg"
echo $(LoadScript) > $raw_data_file_path

# Interpreter raw data and store
./interpreter.py -i $raw_data_file_path -o $data_file_path -info $info_load_path
wait $!

say "`cat < $info_load_path`"