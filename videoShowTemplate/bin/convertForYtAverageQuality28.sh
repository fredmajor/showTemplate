#!/bin/bash

SUFFIX="COMPRESSED_YT_AVG_28_SLOW"

SAVEIF=$IFS
IFS=$(echo -en "\n\b")

for file in $(ls {*mkv,*mov,*mp4})
do
	filename=$(basename "$file")
	filename="${filename%.*}"
	if [[ $filename == *"COMPRESSED"* ]]; then
		continue
	fi
	
	fout=${filename}_${SUFFIX}.mkv
	echo "$filename > $fout"
	time ffmpeg -v quiet  -stats -i "$file" -c:v libx264 -preset slow -crf 28 -c:a copy -pix_fmt yuv420p "$fout" 
done

IFS=$SAVEIFS
	 #&> /dev/null
