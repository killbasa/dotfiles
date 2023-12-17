#!/usr/bin/env bash

DIR=$(dirname "$0")
cd "$DIR"

. ../../scripts/functions.sh

SOURCE="$(realpath .)"
FISH_PATH="$(realpath ~/.config/fish)"

mkdir -p "$FISH_PATH/functions"
mkdir -p "$FISH_PATH/conf.d"

find * -name "*fish*" | while read fn; do
    symlink "$SOURCE/$fn" "$FISH_PATH/$fn"
done

clear_broken_symlinks "$FISH_PATH"

echo ""
if grep --quiet fish <<< "$SHELL"; then
    echo "Fish shell is already set up."
else
    echo "Changing shell to fish"
    if chsh -s /usr/bin/fish; then
        echo "✓ Changed shell to fish"
    else
        echo "✕ Failed changing shell to fish"
        return 2
    fi
    echo "Running fish initial setup"
    fish -c "setup"
fi
