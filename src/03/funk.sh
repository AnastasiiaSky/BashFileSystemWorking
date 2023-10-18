#!/bin/bash
# regex_folder_name='[A-Za-z]{5,}_[0-3][0-9][0-1][1-2][2][2-3]'
regex_folder_name='*_[0-3][0-9][0-1][1-2][2][2-3]'


function cleaning_by_log {
    log="$(cat ../02/log.txt | awk -F'  ' '{print $1}')"
    pattern='^\/'
    for i in $log
    do
    if [[ $i =~ $pattern ]]
    then
        sudo rm -rf $i
    fi
    done
    sudo rm -rf ../02/log.txt
    after_clean=$(df -h / | awk 'sub(/dev/,""){printf $4}')
}


function cleaning_by_time {
    my_place=`pwd`
    echo -e "\n\nTo start cleaning by date/time you should poin date of start, start time, date of end, and end time"
    echo "Please, insert a date of start like this one "YYYY-MM-DD" example: "2022-11-15""
    read start_date
    echo "Please, insert a time of start like this one "HH:MM" example: "13:15""
    read start_time
    echo "Please, insert a date end like this one "YYYY-MM-DD" example: "2022-11-15""
    read end_date
    echo "Please, insert time of end like this one "HH:MM" example: "13:15""
    read end_time
    echo -e "Your start date/time is    ----- $start_date $start_time -----\nYour   end date/time is    ----- $end_date $end_time-----"
    cd /
    sudo rm -rf $(find / -type d -newermt "$start_date $start_time" ! -newermt "$end_date $end_time" 2>/dev/null | grep -E $regex_folder_name) 
    echo "$start_date"
    echo "$end_date"

    cd $my_place
    sudo rm -rf ../02/log.txt

    after_clean=$(df -h / | awk 'sub(/dev/,""){printf $4}')
}

function cleaning_by_mask {
    echo "Write mask for files like this one "_DDMMYY" example:"_141122""
    read mask
    echo "Your mask is $mask"
    sudo rm -rf ../02/log.txt
    . ./clean.sh
    after_clean=$(df -h / | awk 'sub(/dev/,""){printf $4}')
}










