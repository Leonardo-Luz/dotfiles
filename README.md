# Dotfiles

*My Arch environment configuration files.*

> **Warning:**  
> This setup is customized for my workflow.  
> Do not use unless you know what you’re doing.  
> Feel free to fork this repo if you want to adapt it — I push updates that may break existing configs.

## Installation

See [INSTALL.md](./INSTALL.md) for setup instructions.

## Themes

<details open>
  <summary><strong>Available Themes</strong></summary>

  ### Light
  <p align="center">
    <img src="./screenshots/light_1.png" alt="Light Theme 1" width="49%">
    <img src="./screenshots/light_2.png" alt="Light Theme 2" width="49%">
  </p>

  ### Retro
  <p align="center">
    <img src="./screenshots/retro_1.png" alt="Retro Theme 1" width="49%">
    <img src="./screenshots/retro_2.png" alt="Retro Theme 2" width="49%">
  </p>

  ### Solarized
  <p align="center">
    <img src="./screenshots/solarized_1.png" alt="Solarized Theme 1" width="49%">
    <img src="./screenshots/solarized_2.png" alt="Solarized Theme 2" width="49%">
  </p>

</details>

## After Setup

Keep your environment updated and synced using the commands below.

### System Updates

```bash

    # Update system packages
    update-pacman

    # Full system upgrade (-Syu)
    update-pacman -Syu

    # Update AUR packages
    update-yay

    # Full AUR upgrade (-Suy)
    update-yay -Suy

    # Sync and replace configuration files
    RUN_SCRIPT=true config-sync
```

* Useful Links

* [Arch System Maintenance](https://wiki.archlinux.org/title/System_maintenance)
* [Nerd Font Icons](https://www.nerdfonts.com/cheat-sheet)
