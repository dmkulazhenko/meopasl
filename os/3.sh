#!/usr/bin/env bash

if [[ ! -d "${HOME}/source" ]]
then
    echo "Dir ${HOME}/source not found"
    exit 1
fi

if [[ $(ls "${HOME}/source" == "" ]]
then
    echo "Dir ${HOME}/source is empty"
    exit 2
fi

backup="${HOME}/Backup-"$(date +"%Y-%m-%d")
old_backup=""

for ((i = 0; i <= 6; i++))
do
	if [[ -d "${HOME}/Backup-"$(date --date="$i days ago" +"%Y-%m-%d") ]]
	then
		old_backup="${HOME}/Backup-"$(date --date="$i days ago" +"%Y-%m-%d")
		break
	fi
done

if [[ "${old_backup}" == "" ]]
then
	mkdir -p "${backup}"
	cp "${HOME}/source/*" "${backup}/" 2>/dev/null
	echo "["$(date)"] New backup ${backup} created" >> ~/backup-report
	echo "Dumped files: " >> ~/backup-report
	ls "${backup}" | sed 's/\s*//' >> ~/backup-report
else
	new_files="New files: "
	updated_files="Updated files: "
	echo "[$(date)] Backup ${old_backup} updated" >> ~/backup-report
	for file in $(ls "${HOME}/source")
	do
		if [[ ! -e "${old_backup}/${file}" ]]
		then
			cp "${HOME}/source/${file}" "${old_backup}/${file}"
			new_files=${new_files}"\n"${file}
		else
			old_size=$(ls -o "${old_backup}/${file}" | cut -f4 -d ' ')
			new_size=$(ls -o "${HOME}/source/${file}" | cut -f4 -d ' ')
			if [[ "${old_size}" -eq "${new_size}" ]]
			then
				continue
			else
				mv "${old_backup}/${file}" "${old_backup}/${file}.$(date +"%Y-%m-%d")"
				cp "${HOME}/source/${file}" "${old_backup}/${file}"
				updated_files="${updated_files}""\n""${file} ${file}.$(date +"%Y-%m-%d")"
			fi
		fi
	done
	echo -e "${new_files}" >> ~/backup-report
	echo -e "${updated_files}" >> ~/backup-report
fi
echo -e '\n-----------------------------------------------------\n' >> ~/backup-report
