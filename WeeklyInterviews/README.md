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

1) Get the video timebase (tbn): ffprobe vid.mov
1) All video files processed using FFMPEG: -i [ORIGINAL VID] -video_track_timescale [30000 or TIMEBASE] -vcodec libx264 -crf 12 -x264-params keyint=1
1) Get the tone times using this .bat file: @for %%i in (*.mp4) do @ffmpeg -n -t 8 -i "%%i" -filter_complex [0]showspectrum=s=1280x100:mode=combined:color=intensity:saturation=5:slide=1:scale=cbrt,format=yuv420p -vcodec libx264 -x264-params keyint=1 "waveform\%%~ni.mp4"
1) Trim all clips to the tone time MINUS one second
1) Check synchronization of videos using [checkWaveform.vbs](https://raw.githubusercontent.com/td0g/film_production_notes/main/VirtualChoir/checkWaveform.vbs) script.  Run the script in the folder with the trimmed videos and review the waveform.mp4 video.

## Useful Links

* FFMPEG [concat demuxer](http://ffmpeg.org/ffmpeg-formats.html#concat-1)

