#!/usr/bin/env bash

dotfiles_dir=~/dotfiles

. ./scripts/functions.sh

# install linuxbrew
if ! command -v brew > /dev/null; then
  echo "Installing Linuxbrew"
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a $HOME/.profile $HOME/.bashrc >/dev/null
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

yellow "Installing packages"
brew bundle --file="$dotfiles_dir/Brewfile"

# symlinks
yellow "\nSymlinking dotfiles"
symlink "$dotfiles_dir/.editorconfig" "$HOME/.editorconfig"

# Setup CLI - https://github.com/killbasa/cli
if ! command -v kb > /dev/null; then
  echo "Installing CLI"
  curl -L -sSf https://raw.githubusercontent.com/killbasa/cli/main/install.sh | sh
fi

echo ""
echo "✅ Dotfiles installed"
echo ""
echo "    Run the following to setup Fish:"
echo "        bash ~/dotfiles/.config/fish/setup.sh"
echo ""
