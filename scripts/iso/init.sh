#!/bin/bash
set -eEuo pipefail

BOLD="\033[1m"
GREEN="\033[32m"
RESET="\033[0m"

format_packages() {
  local -a pkgs=("$@")
  local result="\n"
  local count=0

  for pkg in "${pkgs[@]}"; do
    ((count++))
    result+="$pkg "

    if (( count == 2 )); then
      result+="\n"
    fi

    if (( count != 3 && count % 3 == 0 )); then
      result+="\n"
    fi
  done

  if (( count == 0 )); then
    echo -e "none"
  else
    echo -e "$result" | sed '/^$/d'
  fi
}

while true; do
gum style --border normal --margin "1 2" --padding "1 2" \
  --border-foreground "#7aa2f7" \
  "$(echo -e "${BOLD}${GREEN}⚙️ Arch Setup Script${RESET}")" \
  "$(echo -e "${BOLD}${GREEN}Made by Leonardo Luz${RESET}")" \

  TERMINAL=$(gum choose --cursor.foreground="#7aa2f7" --header "Select your terminal:" \
    "ghostty" "alacritty" "wezterm")

  BROWSER=$(gum choose --cursor.foreground="#7aa2f7" --header "Select your browser:" \
    "firefox" "qutebrowser")

  if gum confirm "Install emulators?"; then
    EMULATORS=($(gum choose --no-limit --cursor.foreground="#7aa2f7" \
      --header "Select which emulators to install:" \
      "desmume" "mgba-qt" "snes9x"))
  else
    EMULATORS=()
  fi

  AVAILABLE_PACKAGES=(
    "jenkins" "neomutt" "tlp" "docker" "virt-manager"
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

gum style \
  --border rounded \
  --padding "1 2" \
  --margin "1 2" \
  --border-foreground "#a6da95" \
  "$(echo -e "${BOLD}${GREEN}Summary of Selections${RESET}")" \
  "$(echo -e "${BOLD}${GREEN}Terminal:${RESET} $TERMINAL")" \
  "$(echo -e "${BOLD}${GREEN}Browser:${RESET} $BROWSER")" \
  "$(echo -e "${BOLD}${GREEN}Theme:${RESET} $THEME")" \
  "$(echo -e "${BOLD}${GREEN}Emulators:${RESET} ${EMULATORS[*]:-none}")" \
  "$(echo -e "${BOLD}${GREEN}Extra Packages:${RESET} $(format_packages "${CUSTOM_PACKAGES[@]}")")"

  if gum confirm "Proceed with installation?"; then
    break
  else
    clear
  fi
done
