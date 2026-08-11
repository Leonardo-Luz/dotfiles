#!/bin/bash

SRC="$HOME/dotfiles/.config"
DEST="$HOME/.config"

DIFF_FOUND=0

if [ -d "$SRC" ]; then
    for item in "$SRC"/*; do
        name=$(basename "$item")
        target="$DEST/$name"

        if [ -L "$target" ]; then
            link_dest=$(readlink -f "$target")
            src_resolved=$(readlink -f "$item")
            if [ "$link_dest" != "$src_resolved" ]; then
                echo "==> Broken symlink: $target -> $link_dest (expected $src_resolved)"
                DIFF_FOUND=1
            fi
        elif [ -e "$target" ]; then
            echo "==> Not a symlink (regular file/dir): $target"
            DIFF_FOUND=1
        else
            echo "==> Missing in destination: $target"
            DIFF_FOUND=1
        fi
    done
else
    echo "==> Source config directory not found: $SRC."
    exit 1
fi

ZSHRC_SRC="$HOME/dotfiles/zsh/.zshrc"
ZSHRC_DEST="$HOME/.zshrc"

if [ -L "$ZSHRC_DEST" ]; then
    link_dest=$(readlink -f "$ZSHRC_DEST")
    src_resolved=$(readlink -f "$ZSHRC_SRC")
    if [ "$link_dest" != "$src_resolved" ]; then
        echo "==> Broken symlink: $ZSHRC_DEST -> $link_dest (expected $src_resolved)"
        DIFF_FOUND=1
    fi
elif [ -e "$ZSHRC_DEST" ]; then
    echo "==> Not a symlink (regular file): $ZSHRC_DEST"
    DIFF_FOUND=1
else
    echo "==> Missing in destination: $ZSHRC_DEST"
    DIFF_FOUND=1
fi

if [ "$DIFF_FOUND" -eq 0 ]; then
    echo "==> All config symlinks are correct."
    exit 1
else
    exit 0
fi
