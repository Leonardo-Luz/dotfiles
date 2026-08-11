#!/bin/bash

sudo pacman -Syu --noconfirm

sudo pacman -S --needed --noconfirm qt5ct qt5-wayland kvantum

mkdir -p "$HOME/.config/qt5ct/colors"
