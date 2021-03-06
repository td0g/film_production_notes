# Weekly Interviews

Several individuals are interviewed on a weekly basis

# Tools

* Video + Audio capture equipment
* FFMPEG
* Video Editor (iMovie, Shotcut, etc.)

# Studio

## Setup

### Lighting

There are three types of lighting used in our studio: Ambient lighting (the overhead lights), key/fill lighting (the softboxes), and targeted lighting (various lamps).  We try to avoid separate key/fill lights, just keep it simple for the interview look.

* **Light Colour**: Make sure the temperature of all lights are the same!
* **Instructional Videos**: [How to light a SIMPLE INTERVIEW in a Boring Room](https://www.youtube.com/watch?v=Dfv_0Pjni6U) | 
[CINEMATIC COMMERCIAL LIGHTING in 3 MINUTES!](https://www.youtube.com/watch?v=_jgrROV6ci0)

### Camera

Following is a checklist for using **Canon DSLR's** for video recording.  Other types of cameras should try to use the same or similar settings.

* **White Balance**: Use 5600K.  DO NOT USE Auto WB.
* **Quality**: Use 1080p @ 30 fps.  If this is not available then use 720 @ 30 fps.  DO NOT USE 24 fps.
* **Exposure**: Use manual exposure settings - set the aperture / shutter speed, and turn off Auto ISO!  Use the largest aperture available (F/2.8 recommended).  The shutter speed should be the slowest possible (1/30 if recording at 30 fps).  Limit your ISO (on a t5i or 7D, keep the ISO below 800).
* **Style**: Use the Standard recording style.
* **Framing**: If multiple interviews are being filmed, do not adjust the framing after the first interviewee.  Instead adjust the seat to frame the interviewee.  Frame the shot with this in mind.

## Filming

The **directing team** will provide a script for each video feature.

### Camera Checklist

1) Framing - Is the interviewee being clipped?  Is the backdrop well framed?
1) Focus

### Starting WITH Audio Technician

1) The **audio technician** and **camera technicin** will coordinating the start of the recording
1) Everyone is ready, the **camera technician** will begin recording and advise the **audio technician**.  The **audio technician** will begin recording and play an audible tone to sync the tracks.  Everyone must be **silent until the tone is sounded**.  The tone should be sounded 1 - 5 seconds after the video has started recording.  
1) Someone will announce **Interviewee Name** and **Take**
1) Proceed with interview

### Starting WITHOUT Audio Technician

1) The camera technician is responsible for coordinating the start of the recording
1) When everyone is ready, the camera technician will announce something to the effect of '**Recording Start**'  The video recording will begin **immediately AFTER** the announcement.
1) The camera technician will announce **Interviewee** and **Take**
1) Proceed with interview

### After Filming is Finished

* Immediately after filming is complete, a copy of all media will be provided to Tyler for archiving.  This way we don't need to worry about a data retention policy - Tyler will manage archiving.  The media is archived in a robust storage drive with local and offsite backups.

* When the audio has been processed, it will be sent to Tyler for archiving and muxing with the videos.  Tyler will provide the muxed videos to the editor.

* The videos will be archived using the filename syntax *{Date Of Recording YYYY-MM-DD} _ {Index} _ {Name or Description}*

# Editing

### Post Processing

If the audio was recorded separately, the **audio technician** will process the audio and send it to Tyler for archiving and muxing.
1) The best tool for muxing is [FFMPEG](https://ffmpeg.org/download.html).  Talk to Tyler about installing it.
1) Use the following FFMPEG command to get the tone times: ffmpeg -t 10 -i "Audio.wav" -t 10 -i "Video.MOV" -filter_complex "\[0:a\]showwaves=s=1280x202:mode=line\[sw\];\[1:v\]\[sw\]overlay\[\V\]" -map \[V\]:v -map 0:a output.mp4
1) Using the output video, identify the start times of the tone in the Video and the Audio.  Enter the tone times into this command to output a muxed video: ffmpeg -ss *Audio Tone Time* -i "Audio.wav" -ss *Video Tone Time* -i "Video.MOV" -c:v copy -map 1:v -map "0:a" -acodec aac -b:a 320k "mux.mov"
1) Review the video to make sure the speech looks good!
1) Send the muxed video to the video editor

### Video Editing

If you are using a Mac then iMovie is a great tool for editing.  On windows, [Shotcut](https://shotcut.org/download/) is the recommended video editor.

The **directing team** will provide a script which will give the editors an outline of the video.

Familiarize yourself with the Style Guide.
