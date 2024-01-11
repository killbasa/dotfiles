#!/usr/bin/env bash

set -eou pipefail
cd "$HOME/dotfiles"

source ./scripts/colors.sh
source ./scripts/functions.sh

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

echo "Fish setup complete"
echo "You may need to restart your terminal to detect the changes"
