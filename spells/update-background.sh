trap ctrl_c INT

function ctrl_c() {
    feh --bg-center "/usr/share/backgrounds/fedora-workstation/cherryblossom_dark.jpg"
    exit
}

while true
do
    Display=(~/images/bg/*)
    if [ ${1:-0} -eq 1 ]
    then
	Display=(~/images/uncensored/*) 
    fi
    x=$((0 + RANDOM % ${#Display[@]}))
    echo $x
    echo gsettings set org.gnome.desktop.background picture-uri-dark "${Display[$x]}"
    feh --bg-center "${Display[$x]}"
    # gsettings set org.gnome.desktop.background picture-uri-dark "${Display[$x]}"
    sleep 10m
done
