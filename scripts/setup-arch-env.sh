#!/bin/bash
set -euo pipefail

DOTFILES="$HOME/dotfiles"
SCRIPTS="$DOTFILES/scripts"
MARKER_FILE="$HOME/.config/.dotfiles-phase1-complete"

if ! command -v gum &>/dev/null; then
  echo "gum is not installed. Installing..."
  sudo pacman -S --needed --noconfirm gum
fi

gum style --border double --padding "1 2" --foreground 212 \
  "Phase 1: System Setup"

echo

IS_RERUN=false
if [ -f "$MARKER_FILE" ]; then
  IS_RERUN=true

  gum style --foreground 213 \
    "Phase 1 was already completed previously."

  gum style --foreground 255 \
    "Re-running will re-link configs and re-install packages."

  echo

  gum confirm "Continue with re-run?" || exit 0
else
  gum style --foreground 213 "This script will:"
  gum style --foreground 255 "  - Update the system"
  gum style --foreground 255 "  - Install yay (AUR helper)"
  gum style --foreground 255 "  - Install pacman & AUR packages"
  gum style --foreground 255 "  - Link config files & wallpapers"
  gum style --foreground 255 "  - Enable system services"
  gum style --foreground 255 "  - Configure network, firewall, reflector"
  gum style --foreground 255 "  - Install terminal, Qt theming, tmux"

  echo

  gum style --foreground 213 \
    "zsh/oh-my-zsh will be installed in Phase 2 (after reboot)."

  echo

  gum confirm "Continue?" || exit 0
fi


# === UPDATE SYSTEM ===

gum style --foreground 213 "Updating system..."
sudo pacman -Syu --noconfirm


# === INSTALL YAY ===

if command -v yay &>/dev/null && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 "yay already installed. Skipping."
else
  gum style --foreground 213 "Installing yay..."
  "$SCRIPTS/stand-alone/yay.sh"
fi


# === INSTALL PACKAGES ===

gum style --foreground 213 "Installing pacman packages..."
"$SCRIPTS/config/install-pacman-packages.sh"

gum style --foreground 213 "Installing AUR packages..."
"$SCRIPTS/config/install-yay-packages.sh"


# === CREATE DIRECTORIES ===

gum style --foreground 213 "Creating directories..."

mkdir -p "$HOME/documents"
mkdir -p "$HOME/documents/screenshots"
mkdir -p "$HOME/.development"


# === LINK CONFIGS & WALLPAPERS ===

gum style --foreground 213 "Linking config files..."
RUN_SCRIPT=true "$SCRIPTS/config/update-config-files.sh"

gum style --foreground 213 "Linking wallpapers..."
RUN_SCRIPT=true "$SCRIPTS/config/update-wallpapers-files.sh"


# === ENABLE SYSTEM SERVICES ===

gum style --foreground 213 "Enabling system services..."
sudo systemctl enable --now tlp


# === NETWORK ===

if [ -f /etc/NetworkManager/conf.d/wifi_backend.conf ] && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 \
    "Network Manager already configured. Skipping."
else
  gum style --foreground 213 "Configuring Network Manager..."
  "$SCRIPTS/stand-alone/network.sh"
fi


# === REFLECTOR ===

if systemctl is-enabled reflector.timer &>/dev/null && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 \
    "Reflector already configured. Skipping."
else
  gum style --foreground 213 "Configuring Reflector..."
  "$SCRIPTS/stand-alone/reflector.sh"
fi


# === FIREWALL ===

if systemctl is-enabled ufw.service &>/dev/null && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 \
    "Firewall (ufw) already configured. Skipping."
else
  gum style --foreground 213 "Configuring firewall (ufw)..."
  "$SCRIPTS/stand-alone/ufw.sh"
fi


# === TERMINAL ===

gum style --foreground 213 "Installing terminal..."
"$SCRIPTS/stand-alone/terminal.sh"


# === QT THEMING ===

if [ -d "$HOME/.config/qt5ct/colors" ] && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 \
    "Qt theming already configured. Skipping."
else
  gum style --foreground 213 \
    "Configuring Qt theming (qt5ct)..."

  "$SCRIPTS/stand-alone/style.sh"
fi


# === TMUX ===

if [ -d "$HOME/.config/tmux/plugins/catppuccin/tmux" ] && [ "$IS_RERUN" = true ]; then
  gum style --foreground 240 \
    "tmux already configured. Skipping."
else
  gum style --foreground 213 "Configuring tmux..."
  "$SCRIPTS/stand-alone/tmux.sh"
fi


# === DISPLAY MANAGER ===

echo

gum style --foreground 213 "Display manager:"
gum style --foreground 255 \
  "  ly is a lightweight TUI display manager (default)"
gum style --foreground 255 \
  "  lightdm is a graphical display manager with slick-greeter"

if command -v gum &>/dev/null; then

  DM_CHOICE=$(gum choose \
    "ly" \
    "lightdm" \
    --header "Select display manager:" \
    --height 5)

  if [ -z "$DM_CHOICE" ]; then
    DM_CHOICE="ly"
  fi

else

  echo "Choose your display manager: [1] ly (default) [2] lightdm"
  read -r -p "Enter your choice (or press Enter for ly): " input

  case "$input" in
    ""|1)
      DM_CHOICE="ly"
      ;;
    2)
      DM_CHOICE="lightdm"
      ;;
    *)
      echo "Invalid option."
      exit 1
      ;;
  esac

fi

case "$DM_CHOICE" in

  lightdm)
    gum style --foreground 213 "Configuring LightDM..."
    "$SCRIPTS/stand-alone/lightdm.sh"
    ;;

  ly)
    gum style --foreground 213 \
      "Configuring display manager (ly)..."

    sudo pacman -S --needed --noconfirm ly

    sudo cp -f \
      "$DOTFILES/etc/ly/hyprland.desktop" \
      /usr/share/wayland-sessions/hyprland.desktop

    sudo cp -f \
      "$DOTFILES/etc/ly/config.ini" \
      /etc/ly/config.ini

    sudo systemctl enable ly@tty2.service
    ;;

  *)
    gum style --foreground 196 \
      "Invalid display manager selection: $DM_CHOICE"
    exit 1
    ;;

esac


# === OPTIONAL COMPONENTS ===

echo

gum style --foreground 213 "Optional components:"
gum style --foreground 255 \
  "  (Space to select, Enter to confirm, Esc to skip)"

OPTIONAL_LABELS=(
  "Lenovo LOQ 15IRX9 drivers (NVIDIA, Intel, power mgmt)"
  "Bluetooth"
  "Virtualization (virt-manager)"
  "SSH hardening (knockd + iptables)"
  "Emulators (gba, nds, snes)"
  "Password manager (rust-passman-cli)"
  "Waydroid (Android container)"
)

OPTIONAL_SCRIPTS=(
  "lenovo-loq.sh"
  "bluetooth.sh"
  "virt-manager.sh"
  "ssh.sh"
  "emulators.sh"
  "passman.sh"
  "waydroid.sh"
)

if command -v gum &>/dev/null; then

  SELECTED=$(gum choose \
    --no-limit \
    --height 12 \
    --header "Select optional components:" \
    "${OPTIONAL_LABELS[@]}")

else

  SELECTED=""

fi

if [ -n "$SELECTED" ]; then

  while IFS= read -r label; do

    for i in "${!OPTIONAL_LABELS[@]}"; do

      if [ "$label" = "${OPTIONAL_LABELS[$i]}" ]; then

        script="${OPTIONAL_SCRIPTS[$i]}"

        gum style --foreground 213 \
          "Installing $label..."

        if ! "$SCRIPTS/stand-alone/$script"; then
          gum style --foreground 196 \
            "Failed to install $label. Continuing..."
        fi

        break
      fi

    done

  done <<< "$SELECTED"

fi


# === OPTIONAL DEV TOOLS ===

echo

gum style --foreground 213 "Dev tools:"
gum style --foreground 255 \
  "  (Space to select, Enter to confirm, Esc to skip)"

DEV_LABELS=(
  "Docker"
  "Rust"
  "Flutter"
  "Go (relocate ~/go)"
  ".NET"
  "Laravel (PHP)"
  "LaTeX"
  "JMeter"
  "MariaDB"
  "MongoDB"
  "PostgreSQL"
  "Firebase"
  "ngrok"
  "Unity"
)

DEV_SCRIPTS=(
  "docker.sh"
  "rust.sh"
  "flutter.sh"
  "go.sh"
  "dotnet.sh"
  "laravel.sh"
  "latex.sh"
  "jmeter.sh"
  "mariadb.sh"
  "mongodb.sh"
  "postgres.sh"
  "firebase.sh"
  "ngrok.sh"
  "unity.sh"
)

if command -v gum &>/dev/null; then

  SELECTED=$(gum choose \
    --no-limit \
    --height 16 \
    --header "Select dev tools:" \
    "${DEV_LABELS[@]}")

else

  SELECTED=""

fi

if [ -n "$SELECTED" ]; then

  while IFS= read -r label; do

    for i in "${!DEV_LABELS[@]}"; do

      if [ "$label" = "${DEV_LABELS[$i]}" ]; then

        script="${DEV_SCRIPTS[$i]}"

        gum style --foreground 213 \
          "Installing $label..."

        if ! "$SCRIPTS/stand-alone/dev/$script"; then
          gum style --foreground 196 \
            "Failed to install $label. Continuing..."
        fi

        break
      fi

    done

  done <<< "$SELECTED"

fi


# === MARKER FILE ===

mkdir -p "$HOME/.config"
touch "$MARKER_FILE"


# === SUMMARY ===

echo

gum style \
  --border double \
  --padding "1 2" \
  --foreground 212 \
  "Phase 1 complete!"

gum style --foreground 213 "Next steps:"
gum style --foreground 255 \
  "  1. Reboot the system"

gum style --foreground 255 \
  "  2. Run Phase 2:  ~/dotfiles/scripts/setup-post-reboot.sh"

echo

gum style --foreground 240 \
  "  (zsh, oh-my-zsh, and plugins are installed in Phase 2"

gum style --foreground 240 \
  "   because they break the current shell session)"
