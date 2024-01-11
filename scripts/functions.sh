#!/usr/bin/env bash

symlink() {
	if [ -e "$2" ] || [ -h "$2" ]; then
		if ! rm -r "$2"; then
			echo "✕ Failed to remove existing file(s) at $2."
		fi
	fi

	if ln -s "$1" "$2"; then
		echo "✓ Symlinked $2 to $1."
	else
		echo "✕ Symlinking $2 to $1 failed."
	fi
}

clear_broken_symlinks() {
	find -L "$1" -type l | while read fn; do
		if rm "$fn"; then
			echo "✓ Removed broken symlink at $fn."
		else
			echo "✕ Failed to remove broken symlink at $fn."
		fi
	done
}

mk_stow() {
	mkdir -p "$XDG_CONFIG_HOME/$1"

	if stow -d $DOTFILES_HOME/.config -t "$XDG_CONFIG_HOME/$1" "$1"; then
		echo "Stowed $1 to $XDG_CONFIG_HOME/$1."
	else
		echo "✕ Failed to stow $1 to $XDG_CONFIG_HOME/$1."
	fi
}
