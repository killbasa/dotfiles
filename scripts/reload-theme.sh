#!/usr/bin/env bash

set -eo pipefail

theme=$1
if [ -z "$theme" ]; then
  	echo "Failed to reload theme"
	exit 1
fi

source $XDG_CONFIG_HOME/tmux-powerline/config.sh

source $XDG_CONFIG_HOME/tmux/plugins/tmux-powerline/lib/colors.sh
source $XDG_CONFIG_HOME/tmux/plugins/tmux-powerline/lib/powerline.sh
source $XDG_CONFIG_HOME/tmux/plugins/tmux-powerline/config/helpers.sh

source $XDG_CONFIG_HOME/tmux-powerline/themes/${theme}.sh

init_powerline
