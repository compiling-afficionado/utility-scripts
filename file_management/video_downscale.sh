#!/bin/bash
OIFS="$IFS"
IFS=$'\n'
echo "Scanning directory..."
for vid in *; do
	if [[ "${vid}" == *.mov || "${vid}" == *.m4v || "${vid}" == *.mp4 || "${vid}" == *.mkv ]]; then
		size=$(ffprobe -v error -select_streams v:0 -show_entries stream=height,width -of csv=s=x:p=0 "$vid")
		echo "$vid - $size"
		waste_left="${size%%x*}"
		waste_right="${size#*x}"
		if [ "$size" == '' ]; then
			echo "Error getting size, skipping $vid"
			continue
		fi
		if [ $waste_left -gt 1920 ] || [ $waste_right -gt 1920 ]; then
			echo "$size is above threshold, checking for existing downscale..."
			if [ ! -e ./downscale_"$vid" ]; then
				length=$(ffprobe -v error -select_streams v:0 -show_entries stream=duration -of csv=p=0 -sexagesimal "$vid")
				echo "TIME: $length"
				if [ $waste_left -gt $waste_right ]; then
					ffmpeg -v quiet -stats -i "$vid" -filter:v scale=-2:720 -c:a copy "downscale_$vid"
				else
					ffmpeg -v quiet -stats -i "$vid" -filter:v scale=720:-2 -c:a copy "downscale_$vid"
				fi
				echo "Downscaled file created: downscale_$vid"
			else
				echo "Downscale already exists: downscale_$vid"
			fi
		fi
	fi
done
IFS="$OIFS"
