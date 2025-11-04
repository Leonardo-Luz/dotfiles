#!/usr/bin/env bash
set -euo pipefail

# --- Configuration ---
THEMES_DIR="$HOME/.config/themes"
CURRENT_LINK="$THEMES_DIR/current"

theme="${1:-}"
theme_dir="$THEMES_DIR/$theme"

# --- Sanity checks ---
if [ -z "$theme" ]; then
  echo "Usage: $0 <theme>"
  exit 1
fi

if [ ! -d "$theme_dir" ]; then
  echo "Theme '$theme' not found in $THEMES_DIR"
  exit 1
fi

# --- Update symlink ---
ln -nsf "$theme_dir" "$CURRENT_LINK"
echo "→ Switching to theme: $theme"

# --- File link mapping ---
declare -A links=(
  ["$HOME/.zshrc.d/styles"]="fzf.zsh"
  ["$HOME/.config/ghostty/themes"]="ghostty.theme"
  ["$HOME/.config/ghostty/shaders"]="ghostty_cursor_trail.glsl"
  ["$HOME/.config/hypr"]="hyprpaper.conf"
  ["$HOME/.config/mako"]="mako"
  ["$HOME/.config/tmux/themes"]="tmux_theme.conf"
  ["$HOME/.config/waybar"]="waybar.css"
  ["$HOME/.config/wofi"]="wofi.css"
  ["$HOME/.config/hypr/hyprland"]="appearance.conf"
  ["$HOME/.zshrc.d/ohmyzsh"]="ohmyzsh.zsh"
  ["$HOME/.config/qutebrowser/config"]="appearance.py"
  ["$HOME/.config/obs-studio/themes"]="obs-theme.obt"
  ["$HOME/.config/qt5ct/colors"]="qt.conf"
  ["$HOME/.local/share/color-schemes/kvtheme"]="kvtheme.kvconfig"
)

for dest_dir in "${!links[@]}"; do
  file="${links[$dest_dir]}"
  if [ -d "$dest_dir" ] && [ -f "$CURRENT_LINK/$file" ]; then
    ln -sf "$CURRENT_LINK/$file" "$dest_dir/${file##*/}"
    echo "Linked: $file → $dest_dir/"
  fi
done

# --- Reload / refresh components ---
pkill hyprpaper && hyprpaper & disown
pkill waybar && waybar & disown
pkill mako && mako & disown

# Reload zsh (if running under zsh)
if [ -n "${ZSH_VERSION:-}" ]; then
  source "$HOME/.zshrc"
fi

notify-send "Theme switched to '$theme'"
