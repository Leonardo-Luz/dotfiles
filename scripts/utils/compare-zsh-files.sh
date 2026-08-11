#!/bin/bash

SRC_DIR="$HOME/dotfiles/zsh"
DEST_ZSHRC="$HOME/.zshrc"

DIFF_FOUND=0

# Check .zshrc symlink
if [ -L "$DEST_ZSHRC" ]; then
    link_dest=$(readlink -f "$DEST_ZSHRC")
    src_resolved=$(readlink -f "$SRC_DIR/.zshrc")
    if [ "$link_dest" != "$src_resolved" ]; then
        echo "==> Broken symlink: $DEST_ZSHRC -> $link_dest (expected $src_resolved)"
        DIFF_FOUND=1
    fi
elif [ -e "$DEST_ZSHRC" ]; then
    echo "==> Not a symlink (regular file): $DEST_ZSHRC"
    DIFF_FOUND=1
else
    echo "==> Missing in destination: $DEST_ZSHRC"
    DIFF_FOUND=1
fi

# .zshrc.d is now a symlink inside the repo (zsh/.zshrc.d -> ../.config/.zshrc.d)
# and is linked to ~/.config/.zshrc.d via update-config-files.sh
# So we just verify the repo symlink is intact
REPO_ZSHRC_D="$SRC_DIR/.zshrc.d"
if [ -L "$REPO_ZSHRC_D" ]; then
    link_dest=$(readlink -f "$REPO_ZSHRC_D")
    expected="$HOME/dotfiles/.config/.zshrc.d"
    if [ "$link_dest" != "$expected" ]; then
        echo "==> Broken symlink: $REPO_ZSHRC_D -> $link_dest (expected $expected)"
        DIFF_FOUND=1
    fi
else
    echo "==> $REPO_ZSHRC_D is not a symlink"
    DIFF_FOUND=1
fi

if [ "$DIFF_FOUND" -eq 0 ]; then
    echo "==> Zsh config symlinks are correct."
    exit 1
else
    exit 0
fi
