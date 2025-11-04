#!/bin/bash

case "$BROWSER" in
  "qutebrowser")
    sudo pacman -S --needed --noconfirm qutebrowser
    ;;
  "firefox")
    sudo pacman -S --needed --noconfirm firefox
    ;;
  *)
    exit 1
    ;;
esac

