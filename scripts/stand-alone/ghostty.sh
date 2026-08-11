#!/bin/bash

# If pacman ghostty was installed run:
# sudo pacman -R ghostty
# sudo pacman -Rns ghostty-shell-integration ghostty-terminfo
#
# better to just get the yay ghostty-git instead of running this

sudo pacman -S --needed --noconfirm gtk4 gtk4-layer-shell libadwaita blueprint-compiler gettext

TMP_DIR=$(mktemp -d)
git clone https://github.com/ghostty-org/ghostty "$TMP_DIR/ghostty"

cd "$TMP_DIR/ghostty" || exit

zig build -Doptimize=ReleaseFast

mkdir -p "$HOME/.local/bin"

mv zig-out/bin/ghostty "$HOME/.local/bin/ghostty-build"

cd - || exit

rm -rf "$TMP_DIR"
