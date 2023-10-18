#!/bin/bash

. ./checkinput.sh
. ./funk.sh

before_clean=$(df -h / | awk 'sub(/dev/,""){printf $4}')
if [[ $1 -eq 1 ]]
then
cleaning_by_log
elif [[ $1 -eq 2 ]]
then
cleaning_by_time
elif [[ $1 -eq 3 ]]
then
cleaning_by_mask
else 
    echo -e "Wrong parametr\n"
    exit 1
fi
echo "FREE MAMORY BEFORE CLEAN IS $before_clean"
echo "FREE MAMORY AFTER CLEAN IS $after_clean"





