#!/bin/bash
set -eEuo pipefail

if ! command -v gum &>/dev/null; then
  sudo pacman -S --noconfirm gum
fi

TERMINAL="ghostty"
BROWSER="firefox"
THEME="light"
CUSTOM_PACKAGES=()
EMULATORS=()
NGROK_TOKEN=""
RUN_SCRIPT=true

source "$HOME/dotfiles/scripts/iso/init.sh"

sudo pacman -Syu --noconfirm

"$HOME/dotfiles/scripts/stand-alone/yay.sh"
"$HOME/dotfiles/scripts/config/install-yay-packages.sh"

mkdir -p "$HOME/documents"
mkdir -p "$HOME/documents/screenshots"
mkdir -p "$HOME/.development"
mkdir -p "$HOME/.development/tmp"

"$HOME/dotfiles/scripts/config/update-config-files.sh"

"$HOME/dotfiles/scripts/iso/config/ohmyzsh.sh"
"$HOME/dotfiles/scripts/iso/config/organizing-files.sh"
"$HOME/dotfiles/scripts/utils/switch-theme.sh" "$THEME"

"$HOME/dotfiles/scripts/iso/config/terminal.sh"
"$HOME/dotfiles/scripts/iso/config/browser.sh"
"$HOME/dotfiles/scripts/iso/config/custom-packages.sh"

if [[ "${#EMULATORS[@]}" -gt 0 ]]; then
  sudo pacman -S --needed --noconfirm "${EMULATORS[@]}"
fi

gum spin --spinner dot --title "Enabling system services..." -- "$HOME/dotfiles/scripts/iso/config/services.sh"

gum style --border double --border-foreground "#89dceb" --margin "1 2" --padding "1 2" \
  "🎉 Installation completed successfully!"
