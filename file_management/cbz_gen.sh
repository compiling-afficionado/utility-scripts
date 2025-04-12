#!/bin/bash
for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"   # your processing here
	zip ./${D}/${D}.cbz ./${D}/*.png ./${D}/*.jpg
    fi
done
