#!/bin/bash

# Check if the RUN_SCRIPT variable is set to true
if [ "$RUN_SCRIPT" != "true" ]; then
    echo "==> RUN_SCRIPT is not set to 'true'. Script will not run."
    exit 0
fi

SRC="$HOME/dotfiles/wallpapers/"
DEST="$HOME/wallpapers/"

echo "==> Linking wallpapers..."
if [ -d "$SRC" ]; then
    # Create the destination directory if it doesn't exist
    mkdir -p "$DEST"

    # Loop through all wallpapers in the source directory
    for wallpaper in "$SRC"*; do
        target="$DEST/$(basename "$wallpaper")"
        ln -sf "$wallpaper" "$target"
    done

    echo "==> Wallpapers linked to $DEST."
else
    echo "==> Wallpapers directory not found: $SRC."
fi
