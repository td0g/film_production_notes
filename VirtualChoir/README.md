# Virtual Choir

Multiple vocalists were recorded individually in a studio
The video features all of the vocalists in separate panes

# Tools

* Video + Audio capture equipment
* Excel
* FFMPEG

# Process

## Filming

1) A base track was provided by a vocalist
1) All other vocalists used headphones to follow the base track
1) A tone was played by the audio recorder several seconds prior to the base track.  The tone was captured by the video capture device.

##Editing

1) All video files processed using FFMPEG: -ss [TONE TIME MINUS ONE SECOND] -i [ORIGINAL VID] -vcodec libx264 -crf 12 -x264-params keyint=1

