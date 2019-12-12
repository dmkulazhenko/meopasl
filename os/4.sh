#!/usr/bin/env bash

if [[ -d "${HOME}/restore" ]]
then
    echo "Dir ${HOME}/restore already exists."
    exit 1
fi

backup="${HOME}/"$(ls "${HOME}" | grep "^Backup-" | tail -n1)
mkdir "${HOME}/restore"

for file in $(ls "${backup}" | grep -isPvh ".[0-9]{4}-[0-9]{2}-[0-9]{2}$")
do
	cp "${backup}/${file}" "${HOME}/restore/${file}"
done
