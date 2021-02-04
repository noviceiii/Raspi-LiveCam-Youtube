#!/bin/bash

#   Raspii Live Stream to youtube with music.
#   Version 2.1, February 4th, 2021 by Oliver.

#   Drawtext makes it a little slow. Delete drawtext for better performance.
#   Change below values according your needs.

yttoken="your-token-here"                   # string. Youtube token fore live videos.
pll="/path/to/playlist.txt"                 # string. Path to playlist file

ir=30                                       # int. Frame rate for input vidoe from raspivid
b=6000000                                   # int. Bit rate for input vidoe from raspivid 

FPATH="/etc/fonts/FONTFILE.ttf"             # STRING. full path to font file. Optain from google fonts.
OPATH="/path/to/overlay.txt"                # STRING. full path to text file with the text to be embeded.

or=15                                       # int. Bit rate to create output stream. 
                                            # you can set it higher but drawtext makes it all slow.
                                            # and speed shouldn't drop below 1.0

# -----------------------------------------------------------------------------------------------------

raspivid -o - -t 0 -vf -hf -fps $ir -b $b | \
ffmpeg -stream_loop -1 -safe 0 -i $pll \
-f h264 -i - -acodec aac -ab 128k -g 50 -strict experimental \
-vf drawtext="fontfile=$FPATH: \
    textfile=$OPATH: fontcolor=white: fontsize=56: box=1: boxcolor=black@0.5: \
    boxborderw=5: x=w-tw-10: y=h-th-10: reload=1" \
-r $or -f flv rtmp://a.rtmp.youtube.com/live2/$yttoken
