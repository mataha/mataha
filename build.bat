@(goto) 2>nul || call & for %%v in ("%~dp0.\*.m?4?") do @ffmpeg.exe -i "%%~fv" ^
    -c:v libvpx -c:a libvorbis -sn -flags global_header -movflags faststart ^
    -preset veryslow -qmin 0 -qmax 14 -crf 14 -b:v 2M -map 0:v:0? -map 0:a:0? ^
    -map_metadata -1 -map_chapters -1 -f "webm" -y "%%~dpnv.webm"
