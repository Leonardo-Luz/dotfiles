#!/bin/bash

TMP_DIR=$(mktemp -d)
wget -O "$TMP_DIR/ngrok-v3-stable-linux-amd64.tgz" https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

sudo tar xzf "$TMP_DIR/ngrok-v3-stable-linux-amd64.tgz" -C /usr/local/bin

rm -rf "$TMP_DIR"

echo "authentication: ngrok config add-authtoken <token>"
echo "get your token in ngrok web dashboard"

echo "docs: https://ngrok.com/docs/guides/device-gateway/linux/"
