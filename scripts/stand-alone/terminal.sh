#!/bin/bash

sudo pacman -Syu --noconfirm
yay -Suy --noconfirm

if command -v gum &>/dev/null; then
  TERMINAL=$(gum choose "ghostty" "alacritty" "wezterm" --header "Choose your terminal:" --height 5)
  if [ -z "$TERMINAL" ]; then
    TERMINAL="ghostty"
  fi
else
  echo "Choose your terminal: [1] ghostty (default) [2] alacritty [3] wezterm"
  read -r -p "Enter your choice (or press Enter for ghostty): " input
  case "$input" in
    ""|1) TERMINAL="ghostty" ;;
    2) TERMINAL="alacritty" ;;
    3) TERMINAL="wezterm" ;;
    *) echo "Invalid option."; exit 1 ;;
  esac
fi

case "$TERMINAL" in
  ghostty)
    yay -S --needed --noconfirm ghostty-git
    ;;
  alacritty)
    sudo pacman -S --needed --noconfirm alacritty
    ;;
  wezterm)
    yay -S --needed --noconfirm wezterm-git
    ;;
esac
