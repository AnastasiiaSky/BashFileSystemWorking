#!/bin/bash

. ./checkinput.sh
. ./funk.sh

folder_name=$1
f_name="$(echo $2 | awk -F "." '{print $1}')"
file_name_extension="$(echo $2 | awk -F "." '{print $2}')"
file_size=$3
size="$(echo $3 | awk -F "kb" '{print $1}')"
available_space="1000000"
folder_number="$RANDOM%=100"

ways_to_gen