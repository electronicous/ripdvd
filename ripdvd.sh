#!/bin/bash

for i in *BUP;do
    fileinfo=$(mediainfo "$i")
    timecodes=$(echo "$fileinfo" | grep -oP "\d{2}:\d{2}:\d{2}.\d{3}")

    for k in $timecodes;do
        newtimecodes=${newtimecodes}","${k}
    done

    mkvmerge -S "${i::-3}"VOB -o File"${i::-4}".mkv --split timecodes:${newtimecodes#?}
done
