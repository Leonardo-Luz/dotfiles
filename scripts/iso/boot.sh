#!/bin/bash

ansi_art='
 /██                  /██████   /██████ 
| ██                 /██__  ██ /██__  ██
| ██        /██████ | ██  \ ██| ██  \__/
| ██       /██__  ██| ██  | ██|  ██████ 
| ██      | ████████| ██  | ██ \____  ██
| ██      | ██_____/| ██  | ██ /██  \ ██
| ████████|  ███████|  ██████/|  ██████/
|________/ \_______/ \______/  \______/ 
'

LEOS_REPO="${LEOS_REPO:-leonardo-luz/dotfiles}"
CLONNING="\nCloning dotfiles from: https://github.com/${LEOS_REPO}.git"
FOREGROUND_ACCENT="#ff99aa"
FOREGROUND="#ffffff"

clear

echo -e "\n$ansi_art\n"

sudo pacman -Syu --noconfirm --needed gum git

rm -rf ~/.local/share/leos

gum spin --spinner points \
  --title.foreground="$FOREGROUND_ACCENT" \
  --title "$CLONNING" \
  -- git clone "https://github.com/${LEOS_REPO}.git" ~/.local/share/leos

echo -e "\nInstallation starting..."
# source ~/.local/share/leos/scripts/iso/setup-arch-iso.sh

source ~/.local/share/leos/scripts/iso/init.sh
