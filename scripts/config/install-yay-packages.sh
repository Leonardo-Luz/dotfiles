# AUR Packages
yay_pkgs=(
  hyprland
  hyprpaper
  waybar
  wlogout-git
  neofetch
  dolphin
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
