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

## Editing

### Video Prep

1) Get the video timebase (tbn): ffprobe vid.mov
1) All video files processed using FFMPEG: -i [ORIGINAL VID] -video_track_timescale [30000 or TIMEBASE] -vcodec libx264 -crf 12 -x264-params keyint=1
1) Get the tone times using [checkWaveform.vbs](https://raw.githubusercontent.com/td0g/film_production_notes/main/VirtualChoir/checkWaveform.vbs) script.  Run the script in the folder with the original videos
1) Create a .bat file to process every video file: ffmpeg -n -ss 12.17 -i vid.MOV -vf setpts=PTS-STARTPTS -video_track_timescale 30000 -vcodec libx264 -crf 12 -x264-params keyint=1 proc\vid.mp4
1) At the end of the .bat file, add a grid review process: @for %%i in (\*.MOV) do @ffmpeg -n -i "%%i" -vf scale=960:540,drawgrid=h=54:w=96 -vcodec libx264 -crf 22 -preset veryfast "OL\%%~ni.mp4"
1) Scale each video to 640x360 for basic editing.  This will improve speed substantially.

### Video Editing

1) Using the VirtualChoirEditor.xlsm spreadsheet, create the video
1) After reviewing the video framing, re-process the videos as above, except add this line to the filter: ,crop=y=in_h\*0.07:h=in_h\*(1-0.2):x=in_w\*0.15:w=in_w\*(1-0.2),scale=1920:1080 .  This will allow cropping (using the grid review videos, where each grid line corresponds to 0.1 of the image width/height)

## Useful Links

* FFMPEG [concat demuxer](http://ffmpeg.org/ffmpeg-formats.html#concat-1)

