#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm networkmanager iwd

# Changes network backend to iwd, default: wpa_supplicant
SRC="$HOME/dotfiles/etc/NetworkManager/conf.d/wifi_backend.conf"
DEST="/etc/NetworkManager/conf.d/wifi_backend.conf"

# Check if the source file exists
if [ ! -f "$SRC" ]; then
  echo "Error: Source file '$SRC' does not exist."
  exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$(dirname "$DEST")" || {
  echo "Error: Could not create directory '$(dirname "$DEST")'."
  exit 1
}

# Copy the file using sudo, replacing if it exists
sudo cp -f "$SRC" "$DEST" || {
  echo "Error: Could not copy file '$SRC' to '$DEST'. Check permissions."
  exit 1
}
