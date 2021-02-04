#!/bin/bash

#   Raspii Live Stream to youtube with music.
#   Version 2.1, February 4th, 2021 by Oliver.

#
#   Change below values according your needs.



yttoken="your-code-here"                    # string. Youtube token fore live videos.
pll="/local/path/to/playlist.txt"           # string. Path to playlist file

r=30                                        # int. Frame rate to be uses for input vidoe from raspivid
b=6000000                                   # int. Bit rate to be uses for input vidoe from raspivid 

# -----------------------------------------------------------------------------------------------------

raspivid -o - -t 0 -vf -hf -fps $r -b $b | \
sudo ffmpeg -stream_loop -1 -safe 0 -i $pll \
-f h264 -i - -strict experimental \
-f flv rtmp://a.rtmp.youtube.com/live2/$yttoken


# have an overlay text one day, if raspi or the codec is fast enough....
# to add below line 21, -f h264...
# -vf drawtext="fontfile=/etc/fonts/FONTFILE.ttf: \
#    textfile=overlay.txt: fontcolor=white: fontsize=56: box=1: boxcolor=black@0.5: \
#    boxborderw=5: x=w-tw-10: y=h-th-10: reload=1" \
