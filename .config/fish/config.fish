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

# pnpm
set -gx PNPM_HOME "/home/shane/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end