#!/usr/bin/env bash

STOW_DIRS="fish git k9s nano nvim tmux"

for PACKAGE in $STOW_DIRS; do
	TARGET=${XDG_CONFIG_HOME:-$HOME/.config}

	mkdir -p "$TARGET/$PACKAGE"

	if stow -R -d $HOME/dotfiles/.config -t "$TARGET/$PACKAGE" "$PACKAGE"; then
		echo "Stowed $PACKAGE to $TARGET/$PACKAGE."
	else
		echo "✕ Failed to stow $PACKAGE to $TARGET/$PACKAGE."
	fi
done
