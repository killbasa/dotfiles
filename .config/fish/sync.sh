#!/usr/bin/env bash

set -eou pipefail

DIR=$(dirname "$0")
cd "$DIR"

source ../../scripts/functions.sh

sync_dirs() {
	SOURCE="$(realpath .)"
	FISH_PATH="$(realpath ~/.config/fish)"

	mkdir -p "$FISH_PATH/functions"
	mkdir -p "$FISH_PATH/conf.d"

	find * -name "*fish*" | while read fn; do
		symlink "$SOURCE/$fn" "$FISH_PATH/$fn"
	done

	clear_broken_symlinks "$FISH_PATH"
}

sync_dirs
echo
echo "Fish files synced"
