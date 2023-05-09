#!/usr/bin/env bash

ln -sf "$PWD/Brewfile" "$HOME/.Brewfile"
ln -sf "$PWD/.editorconfig" "$HOME/.editorconfig"
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"

DIR="$HOME/.config"
mkdir -p "$DIR"

ln -sfn "$PWD/.config/fish" "$DIR/fish"
ln -sfn "$PWD/.config/k9s" "$DIR/k9s"
ln -sf "$PWD/starship.toml" "$DIR/starship.toml"

echo "✓ Installation complete"
