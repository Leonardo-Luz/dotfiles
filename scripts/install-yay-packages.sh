# === AUR PACKAGES ===
yay_pkgs=(
  mongodb-bin
  wezterm-git
  hyprland
  hyprpaper
  waybar
  wlogout-git
  dolphin
  # unityhub
  # android-studio
  # flutter
  neovim-nightly-bin
)

echo "==> Installing AUR packages..."
for pkg in "${yay_pkgs[@]}"; do
  if ! pacman -Qi "$pkg" &>/dev/null; then
    yay -S --noconfirm "$pkg"
  else
    echo "$pkg is already installed. Skipping."
  fi
done
