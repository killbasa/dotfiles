#!/usr/bin/env bash

STOW_DIRS="fish git k9s nano nvim"

for PACKAGE in $STOW_DIRS; do
	mkdir -p "$XDG_CONFIG_HOME/$PACKAGE"

	if stow -R -d $DOTFILES_HOME/.config -t "$XDG_CONFIG_HOME/$PACKAGE" "$PACKAGE"; then
		echo "Stowed $PACKAGE to $XDG_CONFIG_HOME/$PACKAGE."
	else
		echo "✕ Failed to stow $PACKAGE to $XDG_CONFIG_HOME/$PACKAGE."
	fi
done
