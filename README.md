# utility-scripts
Loose collection of system and file management scripts written in multiple languages.
The idea behind this repo is to enable quick transfer of scripts written as part of automation efforts.
None of these are good, and all of these are specific to my use case. Keeping this public for ease of access.
If you find any of this useful or helpful, my cockles are warmed.

# cbz_gen
Packing folders w/ PNG/JPG files into CBZ archive format. Name of folder is retained and becomes the name of the archive.
All archives in script running dir will be packaged. Only PNG/JPG/JPEG format supported.

# video_downscale
Traverses all files in script running dir, gathers metadata for MP4, MOV, MKV files.
If maximum vertical/horizontal size is reached (def: $AMOUNTpx), video file will be downscaled to 1080x720.
Downscaled files prepended w/ "downscale_", original file retained.
If a file needs downscaling and no file w/ name format "downscale_$FILENAME" exists, video will be downscaled,
even if a differently named downscale exists. Relies on ffprobe and ffmpeg.
