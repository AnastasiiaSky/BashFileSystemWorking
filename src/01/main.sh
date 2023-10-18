#! /bin/bash

way=$1
total_number_of_dir=$2 
directory_name=$3
file_number=$4
name="$(echo $5 | awk -F "." '{print $1}')"
file_name_extension="$(echo $5 | awk -F "." '{print $2}')"
file_kilo=$6
size="$(echo $6 | awk -F "kb" '{print $1}')"
available_space="1000000"
check=0

. ./checkinput.sh
. ./funk.sh

touch log.txt
create_dirertory_with_name


