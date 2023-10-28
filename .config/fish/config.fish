source ~/.config/fish/alias.fish

set fish_greeting ""

export DOTFILES_REPO="https://github.com/killbasa/dotfiles"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DOCKER_SCAN_SUGGEST="false"

## Setup Linuxbrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install Starship
starship init fish | source

# Setup direnv
direnv hook fish | source

# Setup Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Setup Bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
