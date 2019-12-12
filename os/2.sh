#!/usr/bin/env bash

if [[ ! -d "${HOME}/.trash" ]]
then
    echo "Bin is empty"
    exit 0
fi

if [[ ! -e "${HOME}/.trash/.trash.log" ]]
then
    echo "File ${HOME}/.trash/.trash.log not found"
    exit 1
fi

flag=0

for res in $(grep -i $1 "${HOME}/.trash/.trash.log")
do
	path=$(echo "$res" | cut -f1 -d ':')
	link=$(echo "$res" | cut -f2 -d ':')
	if [[ ! -e ${link} ]]
	then
		continue
	fi
	if [[ -e "$path" || -d "$path" ]]
    then
        echo "Found deleted file $path but file or directory already exist"
        continue
    fi
	echo "Restore ${path} (y/n)"
	read ans
	if [[ "${ans}" == "y" || "${ans}" == "Y"  ]]
	then
	    flag=1
	    break
	fi
done

if [[ "${flag}" == "0" ]]
then
	echo "No file selected"
	exit 2
fi

ln "${link}" "${path}"
rm "${link}"
