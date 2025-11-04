#!/bin/bash

sudo pacman -S --needed --noconfirm mariadb

if ! systemctl is-active --quiet mariadb; then
    sudo mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
    sudo mariadb-secure-installation
fi
