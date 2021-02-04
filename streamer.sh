#!/bin/bash

#   Raspii Live Stream to youtube with music.
#   Version 2.3, February 4th, 2021 by Oliver.

#   Drawtext makes it a little slow. Delete drawtext for better performance.
#   Bitrate shouldn't drop below 400 kbit/s; speed shouldn't be less than 1x

#   Change below values according your needs.

yttoken="your-token-here"                   # string. Youtube token fore live videos.
pll="/path/to/playlist.txt"                 # string. Path to playlist file

ir=30                                       # int. Frame rate for input vidoe from raspivid
b=6000000                                   # int. Bit rate for input vidoe from raspivid 

FPATH="/etc/fonts/FONTFILE.ttf"             # STRING. full path to font file. Optain from google fonts.
OPATH="/path/to/overlay.txt"                # STRING. full path to text file with the text to be embeded.

or=15                                       # int. frame rate to create output stream. 

# -----------------------------------------------------------------------------------------------------

raspivid -o - -t 0 -vf -hf -fps $ir -b $b | \
ffmpeg -stream_loop -1 -safe 0 -i $pll \
-f h264 -i - -acodec copy -strict experimental \
-vf drawtext="fontfile=$FPATH: \
    textfile=$OPATH: fontcolor=white: fontsize=56: box=1: boxcolor=black@0.5: \
    boxborderw=5: x=w-tw-10: y=h-th-10: reload=1" \
-r $or -maxrate 2000k -bufsize 10M -f flv rtmp://a.rtmp.youtube.com/live2/$yttoken
