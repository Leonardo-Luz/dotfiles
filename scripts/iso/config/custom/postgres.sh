#!/bin/bash

sudo pacman -S --needed --noconfirm postgresql

if ! systemctl is-active --quiet postgresql; then
    if [ ! -f /var/lib/postgres/data/PG_VERSION ]; then
        sudo -iu postgres initdb --locale "$LANG" -D /var/lib/postgres/data
    fi
fi
