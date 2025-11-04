#!/bin/bash

DEVELOPMENT_DIR="$HOME/.development"

FLUTTER_VERSION="3.32.8"
FLUTTER_BASE_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/linux"

FLUTTER_URL="${FLUTTER_BASE_URL}/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz"

if ! command -v flutter &>/dev/null; then
  echo "==> Installing Flutter ${FLUTTER_VERSION}..."

  wget -c "$FLUTTER_URL" -O "flutter_${FLUTTER_VERSION}_linux.tar.xz" || {
    echo "Error: Failed to download Flutter. Check your internet connection and try again."
    exit 1
  }

  tar -xf "flutter_${FLUTTER_VERSION}_linux.tar.xz" -C "$DEVELOPMENT_DIR" || {
    echo "Error: Failed to extract Flutter archive."
    exit 1
  }

  rm "flutter_${FLUTTER_VERSION}_linux.tar.xz"

  # yes | flutter doctor --android-licenses
else
  echo "Flutter is already installed."
fi

