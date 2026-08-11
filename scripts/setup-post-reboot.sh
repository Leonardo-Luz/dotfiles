#!/bin/bash
set -euo pipefail

if ! command -v gum &>/dev/null; then
  echo "gum is not installed. Install it with: sudo pacman -S gum"
  exit 1
fi

gum style --border double --padding "1 2" --foreground 212 \
  "Phase 2: Post-Reboot Setup"

echo
gum style --foreground 213 "Checking prerequisites..."

if ! command -v zsh &>/dev/null; then
  gum style --foreground 196 "zsh is not installed. Install it with: sudo pacman -S zsh"
  gum confirm "Install zsh now?" && sudo pacman -S --needed --noconfirm zsh
  if ! command -v zsh &>/dev/null; then
    gum style --foreground 196 "zsh installation failed. Cannot continue."
    exit 1
  fi
fi
gum style --foreground 46 "zsh is installed."

gum spin --spinner dot --title "Checking oh-my-zsh..." -- sleep 1

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  gum confirm "oh-my-zsh is not installed. Install it now?" || exit 0

  gum style --foreground 213 "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    gum style --foreground 196 "oh-my-zsh installation failed."
    exit 1
  fi
  gum style --foreground 46 "oh-my-zsh installed."
else
  gum style --foreground 46 "oh-my-zsh already installed."
fi

ZSH="$HOME/.oh-my-zsh"

gum style --foreground 213 "Installing zsh plugins..."

if [ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH/custom/plugins/zsh-syntax-highlighting"
  gum style --foreground 46 "  zsh-syntax-highlighting installed."
else
  gum style --foreground 240 "  zsh-syntax-highlighting already installed."
fi

if [ ! -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH/custom/plugins/zsh-autosuggestions"
  gum style --foreground 46 "  zsh-autosuggestions installed."
else
  gum style --foreground 240 "  zsh-autosuggestions already installed."
fi

gum style --foreground 213 "Linking config files..."
RUN_SCRIPT=true "$HOME/dotfiles/scripts/config/update-config-files.sh"
gum style --foreground 46 "Config files linked."

gum style --foreground 213 "Setting default shell to zsh..."
if [ "$SHELL" != "$(command -v zsh)" ]; then
  chsh -s "$(command -v zsh)"
  gum style --foreground 46 "Default shell set to zsh."
else
  gum style --foreground 240 "Default shell is already zsh."
fi

# === GIT USER CONFIG ===
echo
gum style --foreground 213 "Git user configuration:"

CURRENT_NAME=$(git config --global user.name 2>/dev/null || echo "")
CURRENT_EMAIL=$(git config --global user.email 2>/dev/null || echo "")

SKIP_GIT=0

if [ -n "$CURRENT_NAME" ] && [ -n "$CURRENT_EMAIL" ]; then
  gum style --foreground 240 "  Git is already configured: $CURRENT_NAME <$CURRENT_EMAIL>"
  if ! gum confirm "Reconfigure?"; then
    SKIP_GIT=1
  fi
fi

if [ "$SKIP_GIT" -eq 0 ]; then
  GIT_NAME=$(gum input --placeholder "Git user.name" --value "$CURRENT_NAME" --header "Enter your name:")
  GIT_EMAIL=$(gum input --placeholder "Git user.email" --value "$CURRENT_EMAIL" --header "Enter your email:")

  if [ -n "$GIT_NAME" ]; then
    git config --global user.name "$GIT_NAME"
  fi
  if [ -n "$GIT_EMAIL" ]; then
    git config --global user.email "$GIT_EMAIL"
  fi
  gum style --foreground 46 "Git configured: $GIT_NAME <$GIT_EMAIL>"
fi

echo
gum style --border double --padding "1 2" --foreground 212 \
  "Phase 2 complete!"

# === THEME SELECTION ===
echo
gum style --foreground 213 "Theme selection:"

THEMES_DIR="$HOME/.config/themes"
AVAILABLE_THEMES=$(ls -1 "$THEMES_DIR" 2>/dev/null | grep -v "^current$" | grep -v "^$" || echo "")

if [ -z "$AVAILABLE_THEMES" ]; then
  gum style --foreground 196 "No themes found in $THEMES_DIR. Skipping theme selection."
else
  CURRENT_THEME=""
  if [ -L "$THEMES_DIR/current" ]; then
    CURRENT_THEME=$(basename "$(readlink "$THEMES_DIR/current")")
  fi

  if [ -n "$CURRENT_THEME" ]; then
    gum style --foreground 240 "  Current theme: $CURRENT_THEME"
  fi

  gum confirm "Apply default theme (light)?" && "$HOME/dotfiles/scripts/utils/switch-theme.sh" light

  gum confirm "Choose a different theme?" && {
    CHOSEN=$(echo "$AVAILABLE_THEMES" | gum choose --header "Select theme:" --height 10)
    if [ -n "$CHOSEN" ]; then
      "$HOME/dotfiles/scripts/utils/switch-theme.sh" "$CHOSEN"
    fi
  }
fi

gum style --foreground 213 "Next steps:"
gum style --foreground 255 "  1. Log out and log back in (or reboot)"
gum style --foreground 255 "  2. Run 'switch-theme <theme>' to change theme anytime"
gum style --foreground 255 "  3. Check ~/dotfiles/scripts/stand-alone/dev/ for dev tools"
