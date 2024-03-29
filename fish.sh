#!/usr/bin/env bash

set -eou pipefail
cd "$HOME/dotfiles"

source ./scripts/colors.sh

yellow "Setting up fish shell"

if ! test -e "./.config/fish/conf.d/local.fish"; then
	cat << EOF > "./.config/fish/conf.d/local.fish"
## tmux ##
# don't run tmux on startup (1 = true, 0 = false)
set -gx DISABLE_TMUX_INIT 1

## Powerline ##
# weather segment (https://www.latlong.net/)
set -gx TMUX_POWERLINE_SEG_WEATHER_LAT ""
set -gx TMUX_POWERLINE_SEG_WEATHER_LON ""
EOF
fi

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

echo
echo "To install fisher"
echo
echo "curl -sL https://git.io/fisher | source && \\"
echo "    fisher install jorgebucaran/fisher && \\"
echo "    fisher update"
echo
