#!/bin/bash

# Check if the RUN_SCRIPT variable is set to true
if [ "$RUN_SCRIPT" != "true" ]; then
  echo "==> RUN_SCRIPT is not set to 'true'. Script will not run."
  exit 0
fi

echo "==> Linking config files..."
notify-send --app-name=Config "Sync" "Linking config files..."

SRC="$HOME/dotfiles/.config"
DEST="$HOME/.config"

if [ -d "$SRC" ]; then
    # Create the destination directory if it doesn't exist
    mkdir -p "$DEST"

    # Loop through all configs in the source directory
    for config in "$SRC"/*; do
        target="$DEST/$(basename "$config")"
        ln -sf "$config" "$target"
        echo "==> Linked $(basename "$config")"
    done

    echo "==> All configs linked to $DEST."
else
    echo "==> Source config directory not found: $SRC."
fi

ZSH_SRC="$HOME/dotfiles/zsh"

if [ -d "$ZSH_SRC" ]; then
  ln -sf "$ZSH_SRC/.zshrc" "$HOME/.zshrc"
  echo "==> zsh file linked"
fi
