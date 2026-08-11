#!/bin/bash

if ! command -v yay &>/dev/null; then
  TMP_DIR=$(mktemp -d)
  git clone https://aur.archlinux.org/yay-bin.git "$TMP_DIR/yay-bin"
  cd "$TMP_DIR/yay-bin" || exit
  makepkg -si --noconfirm
  cd - || exit
  rm -rf "$TMP_DIR"

  yay -Suy --noconfirm
else
  yay -Suy --noconfirm
fi
