#!/usr/bin/env bash

path=$(readlink -m "$1")

if [[ ! -d "${HOME}/.trash" ]]
then
    mkdir "${HOME}/.trash"
fi

if [[ ! -e "$path" ]]
then
    echo "${path} not found"
    exit 1
fi

if [[ -d "$path" ]]
then
    echo "${path} is a directory"
    exit 2
fi

link_path="${HOME}/.trash/"$(date +%s%N | cut -b1-13)
ln "${path}" "${link_path}"
rm "${path}"
echo "${path}:${link_path}" >> ~/.trash/.trash.log
