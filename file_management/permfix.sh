#!/bin/bash

# Either for dir passed in $1 or cwd
TARGET="${1:-.}"

cd -- "$TARGET" || { echo "Error: cannot cd to '${TARGET}'" >&2; exit 1; }

shopt -s nullglob

for D in */; do
	D="${D%/}" # strip trailing slash from glob
	echo -e 'Permissions before change:'
	ls -ld "$D"
	chmod 775 "$D"
	echo -e "\nApplied chmod to dir: ${D}\nNew permissions:"
	ls -ld "$D"

	# Collect matching files, skip chmod if none found
	files=("$D"/*.mkv "$D"/*.mp4 "$D"/*.avi)
	if (( ${#files[@]} > 0 )); then
		chmod 664 "${files[@]}"
		echo -e '\nAmended files:\n--------------------'
		printf '%s\n' "${files[@]}"
	else
		echo "Files list empty for dir: ${D}"
	fi
done
