#!/bin/bash

TMP_DIR=$(mktemp -d)
git clone https://github.com/leonardo-luz/rust-passman-cli "$TMP_DIR/rust-passman-cli"

cd "$TMP_DIR/rust-passman-cli" || exit

cargo install --path .

cd - || exit

rm -rf "$TMP_DIR"
