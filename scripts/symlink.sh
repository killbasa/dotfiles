#!/usr/bin/env bash

DIR="$HOME/.config"
mkdir -p "$DIR"

ln -sf "$PWD/Brewfile" "$HOME/.Brewfile"
ln -sf "$PWD/.editorconfig" "$HOME/.editorconfig"
ln -sf "$PWD/.gitconfig" "$HOME/.gitconfig"

ln -sfn "$PWD/.config/fish" "$DIR/fish"
ln -sfn "$PWD/.config/k9s" "$DIR/k9s"
ln -sf "$PWD/starship.toml" "$DIR/starship.toml"

# Set Fish as the default shell
sudo chsh -s /usr/bin/fish

echo "✓ Symlink complete"
