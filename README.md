# Youtube live stream with Raspberry Pi 4

The script streamer.sh establishes a live stream from your raspi camera to youtube.
It displays text from overlay.txt and plays music files (mp3) from playlist.txt.

Requirements:
- You need to have a google account on youtube
- you need to have a youtube live stream token
  -> Login on youtube
  -> go to your channel
  -> click "create live stream"
  
It works fine now on a raspy pi 4 with more than 2GB RAM and the given parameters but has its limitations regarding speed.
If you really want to increase speed, remove -vf drawtext... because ffmpeg needs to convert the video stream as long as you have drawtext in it.
Furthter, to avoid speed issues, go with a music codec that doesn't need to be converted (acodec copy) such as mp3.
  
Overlay.txt:
Add any text you want. It will written over the video.
Be carefull with special chars. I haven't extensively tested it yet but I guess it might have issues with special chars.
Escape any special character with a double backslash \\.

Playlist.txt:
Add the full path to your music files. Mind to avoid any blank spaces or special characters or to enquote the full path.
Beyond that, do not change the format or structure of the playlist file.
  
  
The font file I am using is from google fonts. Take whatever you pleases.
-> https://fonts.google.com/
  
Have a look at the final result (search for live cam)
-> https://www.youtube.com/playlist?list=PLcnGcU-Z-RJ1uRxLbBiHb2feVr6tQzJVj
