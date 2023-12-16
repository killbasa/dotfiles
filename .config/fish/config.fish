# Setup fish
set fish_greeting

set -gx DOTFILES_REPO "https://github.com/killbasa/dotfiles"
set -gx DOTFILES_HOME "$HOME/dotfiles"
set -gx DOTFILES_FISH "$DOTFILES_HOME/.config/fish"

source $DOTFILES_FISH/functions/__load.fish
source $DOTFILES_FISH/abbrs.fish

# Setup env
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export DOCKER_SCAN_SUGGEST="false"
export DOTNET_CLI_TELEMETRY_OPTOUT="true"

# Setup Linuxbrew
if not contains /home/linuxbrew/.linuxbrew/bin $PATH
	eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

# Setup starship
if type -q starship
	starship init fish | source
end

# GPG
set -gx GPG_TTY (tty)

# Setup Volta
set -gx VOLTA_HOME "$HOME/.volta"
fish_add_path $VOLTA_HOME/bin

# Setup Bun
set -gx BUN_INSTALL "$HOME/.bun"
fish_add_path $BUN_INSTALL/bin

# Setup Rust
set -gx CARGO_HOME "$HOME/.cargo"
fish_add_path $CARGO_HOME/bin

# Setup Go
set -gx GOPATH "$HOME/go"
fish_add_path $GOPATH/bin

# Setup CLI - https://github.com/killbasa/cli
if ! type -q kb
	curl -L -sSf https://raw.githubusercontent.com/killbasa/cli/main/install.sh | sh
end
