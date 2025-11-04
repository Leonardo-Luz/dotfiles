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
if [ -d "~/.zshrc.d/styles" ]; then
  ln -sf "$CURRENT_LINK/fzf.zsh" ~/.zshrc.d/styles/fzf.zsh
fi

if [ -d "~/.config/ghostty/themes" ]; then
  ln -sf "$CURRENT_LINK/ghostty.theme" ~/.config/ghostty/themes/ghostty.theme
fi

if [ -d "~/.config/ghostty/shaders" ]; then
  ln -sf "$CURRENT_LINK/ghostty_cursor_trail.glsl" ~/.config/ghostty/shaders/ghostty_cursor_trail.glsl
fi

if [ -d "~/.config/hypr" ]; then
  ln -sf "$CURRENT_LINK/hyprpaper.conf" ~/.config/hypr/hyprpaper.conf
fi

if [ -d "~/.config/mako" ]; then
  ln -sf "$CURRENT_LINK/mako" ~/.config/mako/config
fi

if [ -d "~/.config/tmux/themes" ]; then
  ln -sf "$CURRENT_LINK/tmux_theme.conf" ~/.config/tmux/themes/tmux_theme.conf
fi

if [ -d "~/.config/waybar" ]; then
  ln -sf "$CURRENT_LINK/waybar.css" ~/.config/waybar/style.css
fi

if [ -d "~/.config/wofi" ]; then
  ln -sf "$CURRENT_LINK/wofi.css" ~/.config/wofi/style.css
fi

if [ -d "~/.config/hypr/hyprland" ]; then
  ln -sf "$CURRENT_LINK/appearance.conf" ~/.config/hypr/hyprland/appearance.conf
fi

if [ -d "~/.zshrc.d/ohmyzsh" ]; then
  ln -sf "$CURRENT_LINK/ohmyzsh.zsh" ~/.zshrc.d/ohmyzsh/ohmyzsh.zsh
fi

if [ -d "~/.config/qutebrowser/config" ]; then
  ln -sf "$CURRENT_LINK/appearance.py" ~/.config/qutebrowser/config/appearance.py
fi

if [ -d "~/.config/obs-studio/themes" ]; then
  ln -sf "$CURRENT_LINK/obs-theme.obt" ~/.config/obs-studio/themes/justedit.obt
fi

if [ -d "~/.config/qt5ct/colors" ]; then
  ln -sf "$CURRENT_LINK/qt.conf" ~/.config/qt5ct/colors/qt.conf
fi

if [ -d "$HOME/.local/share/color-schemes/kvtheme" ]; then
  ln -sf "$CURRENT_LINK/kvtheme.kvconfig" ~/.local/share/color-schemes/kvtheme/kvtheme.kvconfig
fi

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
