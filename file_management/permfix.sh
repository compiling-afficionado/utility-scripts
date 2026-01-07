for D in *; do
    if [ -d "${D}" ]; then
        ls -ld "${D}"   # your processing here
        chmod 775 "${D}"
        echo "applied chmod to dir"
        ls -ld "${D}"
        chmod 664 ./${D}/*.mkv
        chmod 664 ./${D}/*.mp4
    fi
done
