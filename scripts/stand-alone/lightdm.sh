#!/bin/bash
set -euo pipefail

echo "==> Installing LightDM and Slick Greeter..."
sudo pacman -S --needed --noconfirm lightdm lightdm-slick-greeter

echo "==> Copying LightDM configuration..."
sudo cp -f "$HOME/dotfiles/etc/lightdm/lightdm.conf" /etc/lightdm/lightdm.conf
sudo cp -f "$HOME/dotfiles/etc/lightdm/slick-greeter.conf" /etc/lightdm/slick-greeter.conf

echo "==> Copying Hyprland session desktop file..."
sudo mkdir -p /usr/share/wayland-sessions
sudo cp -f "$HOME/dotfiles/etc/lightdm/hyprland.desktop" /usr/share/wayland-sessions/hyprland.desktop

echo "==> Enabling LightDM service..."
sudo systemctl enable lightdm

echo "==> LightDM configured successfully."
