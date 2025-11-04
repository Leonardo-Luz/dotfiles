#!/bin/bash
set -eEuo pipefail

user=${SUDO_USER:-$USER}

sudo systemctl enable ly.service

if command -v docker &>/dev/null; then
  sudo usermod -aG docker "$user"
fi

if command -v mongodb &>/dev/null; then
    if [ -f /var/lib/mongodb ]; then
      sudo chown -R mongodb:mongodb /var/lib/mongodb
    fi
    if [ -f /tmp/mongodb-27017.sock ]; then
      sudo chown mongodb:mongodb /tmp/mongodb-27017.sock
    fi
fi

if -v libvirtd; then
  sudo usermod -aG libvirt,kvm "$user"
fi
