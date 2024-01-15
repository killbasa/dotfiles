#!/usr/bin/env bash

set -eou pipefail
DOTFILES_DIR="$HOME/dotfiles"
cd "$DOTFILES_DIR"

source ./scripts/colors.sh

# linuxbrew - https://docs.brew.sh/Homebrew-on-Linux
if ! command -v brew > /dev/null; then
	echo "Installing Linuxbrew"
	NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' | tee -a $HOME/.profile $HOME/.bashrc >/dev/null
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

yellow "Installing packages"
brew bundle install --file="$DOTFILES_DIR/Brewfile"

# symlinks
yellow "\nStowing dotfiles"
source ./scripts/stow-sync.sh

# CLI - https://github.com/killbasa/cli
if ! command -v kb > /dev/null; then
	echo "Installing CLI"
	curl -L -sSf https://raw.githubusercontent.com/killbasa/cli/main/install.sh | sh
fi

echo
echo "✅ Dotfiles installed"
echo
echo "    Run the following to setup Fish:"
echo "        ~/dotfiles/fish.sh"
echo "    Run the following to setup tmux:"
echo "        ~/dotfiles/tmux.sh"
echo
