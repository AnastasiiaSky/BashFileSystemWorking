#!/bin/bash

my_place=`pwd`
touch log.txt

function ways_to_gen {
    start_time=$(date +%s)
    START_T=$(date)
    cd /
    for (( fcount=1; fcount<100; fcount++ ))
    do
    way="$(compgen -d / | shuf -n1)"
    if ! [[ $way == "/bin" || $way == "/sbin" || $way == "/proc" || $way == "/sys" ]]
    then
    cd $way
    dir_creating_number=$(($RANDOM%100))
    create_dirertory_with_name $way $dir_creating_number $folder_name
    else 
    continue
    fi
    done
    end_time=$(date +%s)
    END_T=$(date)
    work_time=$(( $end_time - $start_time ))
    echo -e "Start time is - $START_T\nEnd time is - $END_T\nWork time = $work_time sec.\n "
    echo -e "Start time is $START_T\nEnd time is $END_T\nWorking time is $work_time sec." >> log.txt

}

function create_dirertory_with_name {
directory_name=$folder_name
if [[ $check -eq 0 ]]
then
directory_len=${#directory_name}
last_letter=${directory_name:${#directory_name}-1:1}
for (( count=0; count<dir_creating_number; count++ ))
do
while [ $directory_len -lt 4 ]
do
  directory_name+=$last_letter
  directory_len=${#directory_name}
done
full_directory_name=$directory_name
directory_name+=$last_letter
full_directory_name+="_"
full_directory_name+=$(date '+%d%m%y')
path_to_gen=$way
path_to_gen+="/"
path_to_gen+=$full_directory_name
sudo mkdir "$path_to_gen"
cd $my_place
echo "$path_to_gen --- $(date +'%e.%m.%Y') ---"  >> log.txt
cd $way
file_name=$name
file_creating_number=$(($RANDOM%100))
create_files_with_name $f_name $path_to_gen $file_creating_number
done
fi
}


function create_files_with_name {
  cd "$path_to_gen"
  file_name=$f_name
  file_name_len=${#file_name}
  add_filename_letter=${file_name:${file_name}-1:1}
  for (( file_count=0; file_count<file_creating_number; file_count++ ))
  do
  free_memory=$(df -hk / | awk 'sub(/dev/,""){printf("%d\n",$4) }')
  if [[ $free_memory -le "$available_space" ]] 
  then
      echo "Free space is - $free_memory kB. Stopped."
      cd $my_place
      echo "STOPPED!!! Free space is - $free_memory kB. STOPPED!!!!." >> log.txt
      end_time=$(date +%s)
      END_T=$(date)
      work_time=$(( $end_time - $start_time ))
      echo -e "Start time is - $START_T\nEnd time is - $END_T\nWork time = $work_time sec.\n "
      echo -e "Start time is $START_T \nEnd time is $END_T\nWorking time is $work_time sec." >> log.txt
      exit
  else
  while [ $file_name_len -lt 3 ]
  do 
    file_name+=$add_filename_letter
    file_name_len=${#file_name}

  done
  file_name+=$add_filename_letter
  full_file_name=$file_name
  full_file_name+="_"
  full_file_name+=$(date '+%d%m%y')
  full_file_name+="."
  full_file_name+=$file_name_extension
  sudo fallocate -l $file_size "$full_file_name"
  cd $my_place
  echo "$path_to_gen"/"$full_file_name --- $(date +'%e.%m.%Y') --- $file_size " >> log.txt
  cd "$path_to_gen"
  fi
  done
  cd $my_place
}

