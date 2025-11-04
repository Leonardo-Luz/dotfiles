#!/bin/bash

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -d "$ZSH" ]; then
  if [ -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "zsh-syntax-highlighting already installed"
  else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH}/custom/plugins/zsh-syntax-highlighting"
  fi

  if [ -d "$ZSH/custom/plugins/zsh-autosuggestions" ]; then
    echo "zsh-autosuggestions already installed"
  else
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH}/custom/plugins/zsh-autosuggestions"
  fi
fi
