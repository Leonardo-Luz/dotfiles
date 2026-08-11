#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"

echo "==> Installing Lenovo LOQ 15IRX9 drivers and configuration..."

# === NVIDIA DRIVERS (RTX 4050/4060 - Ada Lovelace) ===
echo "==> Installing NVIDIA drivers..."
sudo pacman -S --needed --noconfirm \
  nvidia-open \
  nvidia-utils \
  lib32-nvidia-utils \
  libva-nvidia-driver

# === INTEL DRIVERS (i7-13620H - 13th gen Raptor Lake) ===
echo "==> Installing Intel drivers..."
sudo pacman -S --needed --noconfirm \
  intel-ucode \
  intel-media-driver \
  lib32-intel-media-driver \
  vulkan-intel \
  lib32-vulkan-intel \
  mesa \
  lib32-mesa

# === AUDIO (SOF - Sound Open Firmware) ===
echo "==> Installing audio firmware..."
sudo pacman -S --needed --noconfirm sof-firmware

# === POWER MANAGEMENT ===
echo "==> Installing power management tools..."
sudo pacman -S --needed --noconfirm \
  thermald \
  throttled \
  cpupower \
  lm_sensors \
  dmidecode

# === FIRMWARE UPDATES ===
echo "==> Installing fwupd..."
sudo pacman -S --needed --noconfirm fwupd

# === LENOVO LEGION LINUX (fan control, power modes) ===
echo "==> Installing LenovoLegionLinux (AUR)..."
if ! pacman -Qi lenovolegionlinux-dkms-git &>/dev/null; then
  yay -S --noconfirm lenovolegionlinux-dkms-git
else
  echo "  lenovolegionlinux-dkms-git already installed. Skipping."
fi

# === CONFIG FILES ===
echo "==> Copying modprobe configuration..."
sudo mkdir -p /etc/modprobe.d
sudo cp -f "$DOTFILES/etc/modprobe.d/nvidia.conf" /etc/modprobe.d/nvidia.conf
sudo cp -f "$DOTFILES/etc/modprobe.d/nvidia-pm.conf" /etc/modprobe.d/nvidia-pm.conf
sudo cp -f "$DOTFILES/etc/modprobe.d/i915.conf" /etc/modprobe.d/i915.conf

echo "==> Copying throttled configuration..."
sudo cp -f "$DOTFILES/etc/throttled.conf" /etc/throttled.conf

# === MKINITCPIO (early load NVIDIA + i915) ===
echo "==> Configuring mkinitcpio for early module loading..."
MKINITCPIO_CONF="/etc/mkinitcpio.conf"
if [ -f "$MKINITCPIO_CONF" ]; then
  if ! grep -q "nvidia_drm" "$MKINITCPIO_CONF"; then
    sudo sed -i 's/^MODULES=(/MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm i915 /' "$MKINITCPIO_CONF"
    echo "  Added NVIDIA and i915 modules to mkinitcpio.conf"
  else
    echo "  NVIDIA modules already in mkinitcpio.conf. Skipping."
  fi
  echo "==> Regenerating initramfs..."
  sudo mkinitcpio -P
else
  echo "  WARNING: mkinitcpio.conf not found. Skipping initramfs configuration."
fi

# === ENABLE SERVICES ===
echo "==> Enabling services..."
sudo systemctl enable --now thermald
sudo systemctl enable --now throttled
sudo systemctl enable --now nvidia-powerd
sudo systemctl enable --now fwupd

# === SENSORS DETECTION ===
echo "==> Running sensors detection..."
yes | sudo sensors-detect --auto 2>/dev/null || true

echo "==> Lenovo LOQ 15IRX9 setup complete!"
echo ""
echo "Notes:"
echo "  - Fn+Q cycles performance modes (quiet/balanced/performance)"
echo "  - Fn+Space toggles keyboard backlight"
echo "  - Suspend uses S0ix (Modern Standby), not S3 (deep sleep)"
echo "  - If suspend fails, check NVIDIA S0ix power management in /etc/modprobe.d/nvidia.conf"
echo "  - Fan control may not work on 2024+ LOQ models with LenovoLegionLinux"
