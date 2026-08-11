#!/bin/bash

# https://wiki.archlinux.org/title/Waydroid

sudo pacman -S --needed --noconfirm waydroid

## Kernel config
# sudo modprobe binder_linux
# sudo modprobe ashmem_linux
# sudo mkdir -p /dev/binderfs
# sudo mount -t binder binder /dev/binderfs
# 
# binder /dev/binderfs binder defaults 0 0

waydroid init -s GAPPS

sudo systemctl start waydroid-container.service
sudo systemctl enable waydroid-container.service

# For flutter development sdkmanager is required
# https://developer.android.com/tools/sdkmanager
