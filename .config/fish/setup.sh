#!/usr/bin/env bash

set -eou pipefail

DIR=$(dirname "$0")
cd "$DIR"

source ../../scripts/functions.sh

link_dirs() {
	SOURCE="$(realpath .)"
	FISH_PATH="$(realpath ~/.config/fish)"

	mkdir -p "$FISH_PATH/functions"
	mkdir -p "$FISH_PATH/conf.d"

	find * -name "*fish*" | while read fn; do
		symlink "$SOURCE/$fn" "$FISH_PATH/$fn"
	done

	clear_broken_symlinks "$FISH_PATH"
}

prepare_shell() {
	if grep --quiet fish <<< "$SHELL"; then
		echo "Fish shell is already set up"
	else
		echo "Changing shell to fish"

		FISH_SHELL="/home/linuxbrew/.linuxbrew/bin/fish"

		if cat /etc/shells | grep --invert-match --quiet "$FISH_SHELL"; then
			if echo "$FISH_SHELL" | sudo tee -a /etc/shells >/dev/null; then
				echo "✓ Added fish shell to /etc/shells"
			else
				echo "✕ Failed to add fish shell to /etc/shells"
				return 1
			fi
		fi

		if chsh -s $FISH_SHELL; then
			echo "✓ Changed shell to fish"
		else
			echo "✕ Failed changing shell to fish"
			return 2
		fi
	fi
}

link_dirs
echo
prepare_shell
