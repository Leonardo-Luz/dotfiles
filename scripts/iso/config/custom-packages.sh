#!/bin/bash
set -eEuo pipefail

for pkg in "${CUSTOM_PACKAGES[@]}"; do
  script_path="$HOME/dotfiles/scripts/iso/custom/$pkg.sh"
  if [[ -x "$script_path" ]]; then
    "$script_path"
  else
    gum style --foreground "#f38ba8" "⚠️  Skipping $pkg (no script found)"
  fi
done
