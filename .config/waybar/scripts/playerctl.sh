#!/bin/bash

# ------------------------
# Toggle CAVA graph display
# ------------------------
VISUAL_ENABLED=false  # set to false to disable the graph

# ------------------------
# Handle toggle click
# ------------------------
if [ "$1" == "toggle" ]; then
    playerctl play-pause
    exit 0
fi

# ------------------------
# Exit if no music player is running
# ------------------------
if ! playerctl status &> /dev/null; then
    exit 0
fi

# ------------------------
# Get track info
# ------------------------
STATUS=$(playerctl status)
TITLE=$(playerctl metadata title 2>/dev/null)
ARTIST=$(playerctl metadata artist 2>/dev/null)

[ -z "$TITLE" ] && TITLE="Unknown Title"
[ -z "$ARTIST" ] && DISPLAY_TITLE="$TITLE" || DISPLAY_TITLE="$ARTIST - $TITLE"

MAX_LENGTH=40
if [ ${#DISPLAY_TITLE} -gt $MAX_LENGTH ]; then
    DISPLAY_TITLE="${DISPLAY_TITLE:0:$((MAX_LENGTH-1))}…"
fi

# ------------------------
# Icon for status
# ------------------------
case "$STATUS" in
    "Playing") ICON="" ;;
    "Paused") ICON="" ;;
    *) ICON="" ;;
esac

# ------------------------
# Named pipe for CAVA output
# ------------------------
PIPE="/tmp/cava_waybar_pipe"
if $VISUAL_ENABLED && [ ! -p "$PIPE" ]; then
    mkfifo "$PIPE"
    cava -p ~/.config/cava/waybar.conf > "$PIPE" &
    disown
fi

# ------------------------
# Read one frame from CAVA (if enabled)
# ------------------------
BAR=""
if $VISUAL_ENABLED; then
    raw=$(timeout 0.1 cat "$PIPE" | tail -n 1 2>/dev/null)

    # Convert raw numbers to Unicode bars
    for n in ${raw//;/ }; do
        case $n in
            0) BAR+=" " ;;
            1) BAR+="▁" ;;
            2) BAR+="▂" ;;
            3) BAR+="▃" ;;
            4) BAR+="▄" ;;
            5) BAR+="▅" ;;
            6) BAR+="▆" ;;
            7) BAR+="▇" ;;
            8) BAR+="█" ;;
        esac
    done
fi

# ------------------------
# Output for Waybar
# ------------------------
if $VISUAL_ENABLED; then
    echo "$DISPLAY_TITLE $ICON $BAR"
else
    echo "$DISPLAY_TITLE $ICON"
fi
