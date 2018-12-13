## FFTools

Something to make my life easier when dealing with common FFmpeg tasks. You'll need FFmpeg and Ruby installed.

**mkvwav**  
This will dump a wav file from an MKV.

Usage:  
`ruby fftools.rb mkvwav input.mkv output.mkv`

**mp3img**  
Create the smallest possible video from an mp3 and image file without conversion. Will prompt for image file name. Default is `title-card.png`.

Usage:  
`ruby fftools.rb mp3img input.mp3 output.mp4`

**rotate**  
Rotate an mp4 using metadata - no conversion. Will prompt for rotation amount. Default is `90`.

Usage:  
`ruby fftools.rb rotate input.mp4 output.mp4`