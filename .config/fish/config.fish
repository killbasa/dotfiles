source ~/.config/fish/alias.fish

set fish_greeting ""

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DOCKER_SCAN_SUGGEST="false"

## Setup Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Starship
starship init fish | source
