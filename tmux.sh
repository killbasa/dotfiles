#!/usr/bin/env bash

set -eou pipefail
cd "$HOME/dotfiles"

source ./scripts/colors.sh

yellow "Setting up tmux"

TARGET="$HOME/.config/tmux/plugins/tpm"
if ! test -e "$TARGET" ; then
	echo "tmux is already set up"
else
	mkdir -p "$TARGET"
	git clone https://github.com/tmux-plugins/tpm.git "$TARGET"
	source "$TARGET/bin/install_plugins"

	echo "✓ tmux has been set up"
fi

