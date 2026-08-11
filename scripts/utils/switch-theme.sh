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
# Format: "destination_dir:dest_filename"="source_filename"
# Some apps load a fixed filename (e.g. waybar loads style.css, not waybar.css),
# so we need to control the destination name separately from the source.
declare -A links=(
  ["$HOME/.config/.zshrc.d/styles:fzf.zsh"]="fzf.zsh"
  ["$HOME/.config/ghostty/themes:ghostty.theme"]="ghostty.theme"
  ["$HOME/.config/ghostty/shaders:ghostty_cursor_trail.glsl"]="ghostty_cursor_trail.glsl"
  ["$HOME/.config/hypr:hyprpaper.conf"]="hyprpaper.conf"
  ["$HOME/.config/mako:mako"]="mako"
  ["$HOME/.config/tmux/themes:tmux_theme.conf"]="tmux_theme.conf"
  ["$HOME/.config/waybar:style.css"]="waybar.css"
  ["$HOME/.config/wofi:style.css"]="wofi.css"
  ["$HOME/.config/hypr/hyprland:appearance.conf"]="appearance.conf"
  ["$HOME/.config/.zshrc.d/ohmyzsh:ohmyzsh.zsh"]="ohmyzsh.zsh"
  ["$HOME/.config/qutebrowser/config:appearance.py"]="appearance.py"
  ["$HOME/.config/obs-studio/themes:obs-theme.obt"]="obs-theme.obt"
  ["$HOME/.config/qt5ct/colors:qt.conf"]="qt.conf"
  ["$HOME/.local/share/color-schemes/kvtheme:kvtheme.kvconfig"]="kvtheme.kvconfig"
)

for dest_key in "${!links[@]}"; do
  dest_dir="${dest_key%:*}"
  dest_file="${dest_key##*:}"
  src_file="${links[$dest_key]}"
  if [ -f "$CURRENT_LINK/$src_file" ]; then
    mkdir -p "$dest_dir"
    ln -sf "$CURRENT_LINK/$src_file" "$dest_dir/$dest_file"
    echo "Linked: $src_file → $dest_dir/$dest_file"
  fi
done

# --- Reload / refresh components ---
pkill hyprpaper 2>/dev/null; hyprpaper & disown
pkill waybar 2>/dev/null; waybar & disown
pkill mako 2>/dev/null; mako & disown

# Reload zsh (if running under zsh)
if [ -n "${ZSH_VERSION:-}" ]; then
  source "$HOME/.zshrc"
fi

notify-send "Theme switched to '$theme'"
