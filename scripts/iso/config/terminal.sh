#!/bin/bash

case "$TERMINAL" in
  "ghostty")
    yay -S --needed --noconfirm ghostty-git
    ;;
  "alacritty")
    sudo pacman -S --needed --noconfirm alacritty
    ;;
  "wezterm")
    yay -S --needed --noconfirm wezterm-git
    ;;
  *)
    exit 1
    ;;
esac
