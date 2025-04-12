#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"   # your processing here
	zip ./${D}/${D}.cbz ./${D}/*.{png,jpg}
    fi
done
IFS="$OIFS"
