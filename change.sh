#!/bin/bash
SOURCE_NAME="alsa_input.pci-0000_00_1f.3.analog-stereo"
SOURCE_ID=$(pactl list short sources | grep "$SOURCE_NAME" | awk '{print $1}')

#pactl set-source-mute $SOURCE_ID toggle
qdbus org.kde.kglobalaccel /component/kmix invokeShortcut "mic_mute"

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $(pactl get-source-mute $SOURCE_ID) == "Mute: yes" ]]; then
    echo "Microphone $SOURCE_ID now muted"
    play "$SCRIPT_DIR/snowsgiving_2022_deafen.mp3"
else
    echo "Microphone $SOURCE_ID now unmuted"
    play "$SCRIPT_DIR/snowsgiving_2022_undeafen.mp3"
fi

