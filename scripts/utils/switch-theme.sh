#!/usr/bin/env bash
set -e

# --- Configuration ---
THEMES_DIR="$HOME/.config/themes"
CURRENT_LINK="$THEMES_DIR/current"

theme="$1"
theme_dir="$THEMES_DIR/$theme"

if [ -z "$theme" ]; then
    echo "Usage: $0 <theme>"
    exit 1
fi

if [ ! -d "$theme_dir" ]; then
    echo "Theme '$theme' not found in $THEMES_DIR"
    exit 1
fi

# --- Update current symlink ---
ln -nsf "$theme_dir" "$CURRENT_LINK"
echo "→ Switching to theme: $theme"

# --- Place files in their destinations ---
ln -sf "$CURRENT_LINK/fzf.zsh" ~/.zshrc.d/styles/fzf.zsh
ln -sf "$CURRENT_LINK/ghostty.theme" ~/.config/ghostty/themes/ghostty.theme
ln -sf "$CURRENT_LINK/ghostty_cursor_trail.glsl" ~/.config/ghostty/shaders/ghostty_cursor_trail.glsl
ln -sf "$CURRENT_LINK/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf
ln -sf "$CURRENT_LINK/mako" ~/.config/mako/config
ln -sf "$CURRENT_LINK/tmux_theme.conf" ~/.config/tmux/themes/tmux_theme.conf
ln -sf "$CURRENT_LINK/waybar.css" ~/.config/waybar/style.css
ln -sf "$CURRENT_LINK/wofi.css" ~/.config/wofi/style.css
ln -sf "$CURRENT_LINK/appearance.conf" ~/.config/hypr/hyprland/appearance.conf
ln -sf "$CURRENT_LINK/ohmyzsh.zsh" ~/.zshrc.d/ohmyzsh/ohmyzsh.zsh
ln -sf "$CURRENT_LINK/appearance.py" ~/.config/qutebrowser/config/appearance.py

# --- Reload / refresh components ---

# Hyprland wallpaper
pkill hyprpaper
hyprpaper & disown

# Waybar
pkill waybar
waybar & disown

# Mako
pkill mako
mako & disown

# Reload zsh config for FZF (optional)
if [ -n "$ZSH_VERSION" ]; then
    source ~/.zshrc
fi

notify-send "Theme switched to $theme"
