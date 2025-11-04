#!/bin/bash

wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz

sudo tar xvzf ./ngrok-v3-stable-linux-amd64.tgz -C /usr/local/bin

rm -rf ngrok-v3-stable-linux-amd64.tgz

if [[ -n "$NGROK_TOKEN" ]]; then
  ngrok config add-authtoken "$NGROK_TOKEN"
fi
