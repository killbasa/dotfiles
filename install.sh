#!/usr/bin/env bash

set -eou pipefail

DIR=$(dirname "$0")
cd "$DIR"

source ./scripts/functions.sh

# stow - https://www.gnu.org/software/stow/
if ! command -v stow > /dev/null; then
	echo "Installing stow"
	sudo apt install stow
fi

# linuxbrew - https://docs.brew.sh/Homebrew-on-Linux
if ! command -v brew > /dev/null; then
	echo "Installing Linuxbrew"
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a $HOME/.profile $HOME/.bashrc >/dev/null
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

yellow "Installing packages"
brew bundle --file="$DIR/Brewfile"

# symlinks
yellow "\nSymlinking dotfiles"
symlink "$DIR/.editorconfig" "$HOME/.editorconfig"
symlink "$DIR/.config/nano/.nanorc" "$HOME/.nanorc"

# CLI - https://github.com/killbasa/cli
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
