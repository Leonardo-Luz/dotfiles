#!/usr/bin/env bash
set -e

THEMES_DIR="$HOME/dotfiles/.config/themes"
THEME_SCRIPT="$HOME/dotfiles/scripts/utils/switch-theme.sh"

theme=$(ls -1 "$THEMES_DIR" | wofi --dmenu --prompt "Select Theme:")

# Exit if no selection
if [ -z "$theme" ]; then
    exit 0
fi

# Run your existing theme switcher script with the selected theme
"$THEME_SCRIPT" "$theme"
