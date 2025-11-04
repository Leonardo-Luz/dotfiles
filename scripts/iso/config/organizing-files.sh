#!/bin/bash

echo "==> Moving dev directories to $HOME/development"

if [ -d "$HOME/go" ]; then
  mv "$HOME/go" "$HOME/.development/go"
fi

if [ -d "$HOME/Unity" ]; then
  mv "$HOME/Unity" "$HOME/.development/Unity"
  ln -sf "$HOME/.development/Unity" "$HOME/Unity"
fi

echo "==> Moving config directories to $HOME/.config"
