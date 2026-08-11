## INSTALL SIZE: ~30 GB

## INSTALL GUIDE

### [INSTALL ARCH](./ARCHINSTALL.md)

### SETUP SYSTEM (from clean arch install)

```sh

    # Connect to wifi using network manager
    nmcli device wifi connect YOUR_WIFI_SSDID password YOUR_WIFI_PASSWORD

    # Clone this repository in the home directory
    cd # Goes to the home dir
    git clone https://github.com/leonardo-luz/dotfiles.git

    # Edit the packages you want to install
    vim ~/dotfiles/scripts/config/install-pacman-packages.sh
    vim ~/dotfiles/scripts/config/install-yay-packages.sh

    # Phase 1: System setup (installs packages, configs, services, optional tools)
    # Uses gum TUI to prompt for optional components (bluetooth, virt, dev tools, etc.)
    # Does NOT install zsh/oh-my-zsh (that breaks the shell session)
    ~/dotfiles/scripts/setup-arch-env.sh

    # Reboot before Phase 2
    reboot

    # Phase 2: Post-reboot (installs zsh, oh-my-zsh, plugins, links configs)
    ~/dotfiles/scripts/setup-post-reboot.sh

    # Log out and log back in (or reboot) for shell change to take effect

    # [OPTIONAL] Secure MariaDB
    sudo mariadb_secure_installation

    # [OPTIONAL] Pick a theme
    switch-theme light    # or: solarized, autumn, retro, dark-forest, dracula, tokyonight

    # [OPTIONAL] Install any component you skipped later:
    #   ~/dotfiles/scripts/stand-alone/bluetooth.sh
    #   ~/dotfiles/scripts/stand-alone/virt-manager.sh
    #   ~/dotfiles/scripts/stand-alone/dev/docker.sh
    #   (see ~/dotfiles/scripts/stand-alone/ for all options)

```
