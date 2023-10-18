#!/bin/bash

if [[ $# -eq 0 ]]
then 
    echo -e "No parametrs found.\nPlease, try again."
exit 1
fi

if ! [[ $# -eq 3 ]]
then 
    echo -e "Use 3 paramatrs to ran script.\nPlease, try again."
exit 1
fi

if ! [[ directory_name =~ [[:alpha:]]{1,7}$ ]]
then
    echo -e "Wrong parametr #1\nUse one-seven characters from 'A/a' to 'Z/z' to create names of folders.\nPlease, try again."
exit 1
fi

if ! [[ file_name =~ [[:alpha:]]{1,7}$ ]]
then 
    echo -e "Wrong parametr #2\nUse one-seven characters from 'A/a' to 'Z/z' to create names of files,\nand one-three characters from 'A/a' to 'Z/z' to create file extansion.\Please, try again!"
exit 1
fi

if ! [[ file_name_extension =~ [[:alpha:]]{1,3}$ ]]
then
    echo -e "Wrong parametr #2\nUse one-seven characters from 'A/a' to 'Z/z' to create names of files,\nand one-three characters from 'A/a' to 'Z/z' to create file extansion.\Please, try again!"
exit 1
fi

if [[ ($size -gt 100) || ($size -lt 0) ]]
then
    echo -e "Wrong parametr #3\nUse number fromm 0 to 100 to poing a size in megabytes.\nPlease, try again."
exit 1
fi
