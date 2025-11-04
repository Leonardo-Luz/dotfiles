#!/bin/bash
set -eEuo pipefail

sudo systemctl enable ly.service

if command -v tlp &>/dev/null; then
  sudo systemctl enable --now tlp
fi

if command -v docker &>/dev/null; then
  sudo systemctl enable --now docker
fi

if command -v postgresql &>/dev/null; then
  sudo systemctl enable --now postgresql
fi

if command -v mariadb &>/dev/null; then
  sudo systemctl enable --now mariadb
fi

if command -v mongodb &>/dev/null; then
  sudo systemctl enable --now mongodb
fi

if command -v jenkins &>/dev/null; then
  sudo systemctl enable --now jenkins
fi

if command -v bluetoothctl &>/dev/null; then
  sudo systemctl enable --now bluetooth.service
fi

if command -h reflector &>/dev/null; then
  sudo systemctl start reflector.service
  sudo systemctl enable reflector.timer
fi

if command -v libvirtd &>/dev/null; then
  sudo systemctl enable --now libvirtd
fi
