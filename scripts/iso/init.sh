#!/bin/bash
set -eEuo pipefail

gum style --border normal --margin "1 2" --padding "1 2" \
  --border-foreground "#7aa2f7" \
  "⚙️ Arch Setup Script" "Made by Leonardo Luz"

TERMINAL=$(gum choose --cursor.foreground="#7aa2f7" --header "Select your terminal:" \
  "ghostty" "alacritty" "wezterm")

BROWSER=$(gum choose --cursor.foreground="#7aa2f7" --header "Select your browser:" \
  "firefox" "qutebrowser")

if gum confirm "Install Virtual Manager?"; then
  VIRT_MANAGER=true
fi

if gum confirm "Install emulators?"; then
  EMULATORS=($(gum choose --no-limit --cursor.foreground="#7aa2f7" \
    --header "Select which emulators to install:" \
    "desmume" "mgba-qt" "snes9x"))
fi

AVAILABLE_PACKAGES=(
  "jenkins" "neomutt" "tlp" "docker"
  "dotnet" "flutter" "jmeter" "laravel" "latex"
  "mariadb" "mongodb" "ngrok" "postgres" "rust"
  "unity" "opencode-bin" "geforcenow-electron"
)

CUSTOM_PACKAGES=($(gum choose --no-limit --cursor.foreground="#7aa2f7" \
  --header "Select optional packages to install:" \
  "${AVAILABLE_PACKAGES[@]}"))

if [[ " ${CUSTOM_PACKAGES[*]} " =~ " ngrok " ]]; then
  NGROK_TOKEN=$(gum input --placeholder "Enter your ngrok auth token")
fi

THEME=$(gum choose --cursor.foreground="#7aa2f7" --header "Select theme:" \
  "light" "solarized" "autumn" "retro")

gum style --border rounded --padding "1 2" --margin "1 2" \
  --border-foreground "#a6da95" \
  "Summary of Selections" \
  "Terminal: $TERMINAL" \
  "Browser: $BROWSER" \
  "Theme: $THEME" \
  "Virtual Manager: $VIRT_MANAGER" \
  "Emulators: ${EMULATORS[*]:-none}" \
  "Extra Packages: ${CUSTOM_PACKAGES[*]:-none}"

gum confirm "Proceed with installation?" || exit 1
