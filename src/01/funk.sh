#! /bin/bash

my_place=`pwd`

function create_dirertory_with_name {
if [[ $check -eq 0 ]]
then
directory_len=${#directory_name}
last_letter=${directory_name:${#directory_name}-1:1}
for (( count=0; count<total_number_of_dir; count++ ))
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
sudo mkdir "$way/$full_directory_name"
echo "$way"/"$full_directory_name --- $(date +'%e.%m.%Y') ---"  >> log.txt
file_name=$name
create_files_with_name $file_name
done
fi
}


function create_files_with_name {
  cd "$way/$full_directory_name"
  file_name_len=${#file_name}
  add_filename_letter=${file_name:${file_name}-1:1}
  for (( file_count=0; file_count<file_number; file_count++ ))
  do
  free_memory=$(df -hk / | awk 'sub(/dev/,""){printf("%d\n",$4) }')
  if [[ $free_memory -le "$available_space" ]] 
  then
      echo "Free space is - $available_space kB. Stopped."
  break
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
  sudo fallocate -l $file_kilo "$full_file_name"
  cd $my_place
  echo "$way"/"$full_directory_name"/"$full_file_name --- $(date +'%e.%m.%Y') --- $file_kilo" >> log.txt
  cd "$way/$full_directory_name"
  fi
  done
  cd $my_place
}