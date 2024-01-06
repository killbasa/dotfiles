#!/usr/bin/env bash

YELLOW='\e[33m'
NC='\e[39m'

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

yellow() {
	local message="$1"
	echo -e "${YELLOW}$message${NC}"
}
