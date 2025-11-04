#!/bin/bash

sudo pacman -S --needed --noconfirm rustup

if command -v rustup >/dev/null 2>&1; then
    rustup default stable
fi
