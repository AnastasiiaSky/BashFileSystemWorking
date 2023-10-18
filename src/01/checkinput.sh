#! /bin/bash

if [[ $# -eq 0 ]]
then 
    echo -e "No parametrs found.\nPlease, try again."
exit 1
fi 

if ! [[ $# -eq 6 ]]
then 
    echo -e "Use 6 paramatrs to ran script.\nPlease, try again."
exit 1
fi

if ! [[ -d "$1" ]]
then 
    echo -e "Wrong path.\nPlease, try again."
exit 1
fi

if ! [[ $2 =~ ^[[:digit:]]+$ ]]
then 
    echo -e "Wrong paranetr #2.\nUse numbers from 0 to 9 to point a quantity of folders.\nPlease, try again."
exit 1
fi

if ! [[ $3 =~ ^[[:alpha:]]{1,7}$ ]]
then
    echo -e "Wrong paramer #3\nUse one-seven characters from 'A/a' to 'Z/z' to create names of folders.\nPlease, try again."
exit 1
fi

if ! [[ $4 =~ ^[0-9]+$ ]]
then 
    echo -e "Wrong parametr #4\nUse numbers from 0 to 9 to point a quantity of files.\nPlease, try again."
exit 1
fi

if ! [[ $5 =~ ^[a-zA-Z]{1,7}[.][a-zA-Z]{1,3}$ ]]
then
    echo -e "Wrong parametr #5\nUse seven characters from 'A/a' to 'Z/z' to create names of files, '.' and three characters from 'A/a' to 'Z/z' characters for the extension.\nPlease, try again."
exit 1
fi

if [[ ! ($file_kilo =~ kb) || ($size =~ [^0-9]) || ($size -gt 100) || ($size -lt 0) ]]
then
    echo -e "Wrong parametr #6\nUse number fromm 0 to 100 to poing a size in kilobytes.\nPlease, try again."
    exit 1
fi